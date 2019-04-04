program fd1d_heat_explicit_prb
  use :: types_mod, only: dp

  implicit none

  integer, parameter :: t_num=201
  integer, parameter :: x_num=21

  real (kind=dp) :: cfl
  real (kind=dp) :: dt
  real (kind=dp), allocatable :: h(:)
  real (kind=dp), allocatable :: h_new(:)
! the "matrix" stores all x-values for all t-values
! remember Fortran is column major, meaning that rows are contiguous
  real (kind=dp), allocatable :: hmat(:,:)
  integer :: i
  integer :: j
  real (kind=dp) :: k

  real (kind=dp), allocatable :: t(:)
  real (kind=dp) :: t_max
  real (kind=dp) :: t_min
  real (kind=dp), allocatable :: x(:)
  real (kind=dp) :: x_max
  real (kind=dp) :: x_min

  write (*, '(a)') ' '
  write (*, '(a)') 'FD1D_HEAT_EXPLICIT_PRB:'
  write (*, '(a)') '  FORTRAN77 version.'
  write (*, '(a)') '  Test the FD1D_HEAT_EXPLICIT library.'

  write (*, '(a)') ' '
  write (*, '(a)') 'FD1D_HEAT_EXPLICIT_PRB:'
  write (*, '(a)') '  Normal end of execution.'
  write (*, '(a)') ' '

  write (*, '(a)') ' '
  write (*, '(a)') 'FD1D_HEAT_EXPLICIT_TEST01:'
  write (*, '(a)') '  Compute an approximate solution to the time-dependent'
  write (*, '(a)') '  one dimensional heat equation:'
  write (*, '(a)') ' '
  write (*, '(a)') '    dH/dt - K * d2H/dx2 = f(x,t)'
  write (*, '(a)') ' '
  write (*, '(a)') '  Run a simple test case.'

! heat coefficient
  k = 0.002e+00_dp

! the x-range values
  x_min = 0.0e+00_dp
  x_max = 1.0e+00_dp
! x_num is the number of intervals in the x-direction

  allocate (x(x_num), stat=ierr, errmsg="Problem allocating x variable")
  call r8vec_linspace(x_num, x_min, x_max, x)

! the t-range values. integrate from t_min to t_max
  t_min = 0.0e+00_dp
  t_max = 80.0e+00_dp

! t_num is the number of intervals in the t-direction
  dt = (t_max-t_min)/real(t_num-1, kind=dp)
  allocate(t(t_num), stat=ierr, errmsg="Problem allocating t variable")
  call r8vec_linspace(t_num, t_min, t_max, t)

! get the CFL coefficient
  call fd1d_heat_explicit_cfl(k, t_num, t_min, t_max, x_num, x_min, x_max, &
    cfl)

  if (0.5e+00_dp<=cfl) then
    write (*, '(a)') ' '
    write (*, '(a)') 'FD1D_HEAT_EXPLICIT_CFL - Fatal error!'
    write (*, '(a)') '  CFL condition failed.'
    write (*, '(a)') '  0.5 <= K * dT / dX / dX = CFL.'
    stop
  end if

allocate(h(x_num), stat=ierr, errmsg="Problem allocating h array")

! set the initial condition
  do j = 1, x_num
    h(j) = 50.0e+00_dp
  end do

! set the bounday condition
  h(1) = 90.0e+00_dp
  h(x_num) = 70.0e+00_dp

! initialise the matrix to the initial condition

  allocate(hmat(x_num,t_num), stat=ierr, errmsg="Problem allocating hmat matrix")

  do i = 1, x_num
    hmat(i, 1) = h(i)
  end do

! the main time integration loop

  allocate(h_new(x_num), stat=ierr, errmsg="Problem allocating h_new array")

  do j = 2, t_num
    call fd1d_heat_explicit(x_num, x, t(j-1), dt, cfl, h, h_new)

    do i = 1, x_num
      hmat(i, j) = h_new(i)
      h(i) = h_new(i)
    end do
  end do

  deallocate (h, stat=ierr, errmsg="Problem deallocating h array")
  deallocate (h_new, stat=ierr, errmsg="Problem deallocating h array")

! write data to files
  call r8mat_write('h_test01.txt', x_num, t_num, hmat)
  call r8vec_write('t_test01.txt', t_num, t)
  call r8vec_write('x_test01.txt', x_num, x)

  deallocate (hmat, stat=ierr, errmsg="Problem deallocating hmat matrix")
  deallocate (x, stat=ierr, errmsg="Problem deallocating x array")
  deallocate (t, stat=ierr, errmsg="Problem deallocating t array")

contains

  function func(j, x_num, x) result (d)
    implicit none

    integer, intent(in) :: j, x_num
    real (kind=dp), intent(out) :: d
    real (kind=dp), intent(in) :: x(x_num)

    d = 0.0e+00_dp
  end function

  subroutine fd1d_heat_explicit(x_num, x, t, dt, cfl, h, h_new)
    implicit none

    integer, intent(in) :: x_num

    real (kind=dp), intent(in) :: cfl
    real (kind=dp), intent(in) :: dt
    real (kind=dp), intent(in) :: h(x_num)
    real (kind=dp), intent(out) :: h_new(x_num)
    integer :: j
    real (kind=dp), intent(in) :: t
    real (kind=dp), intent(in) :: x(x_num)
    real (kind=dp) :: f(x_num)

    do j = 1, x_num
      f(j) = func(j, x_num, x)
    end do

    h_new(1) = 0.0e+00_dp

    do j = 2, x_num - 1
      h_new(j) = h(j) + dt*f(j) + cfl*(h(j-1)-2.0e+00_dp*h(j)+h(j+1))
    end do

! set the boundary conditions again
    h_new(1) = 90.0e+00_dp
    h_new(x_num) = 70.0e+00_dp
  end subroutine

  subroutine fd1d_heat_explicit_cfl(k, t_num, t_min, t_max, x_num, x_min, &
    x_max, cfl)

    implicit none

    real (kind=dp), intent(out) :: cfl
    real (kind=dp) :: dx
    real (kind=dp) :: dt
    real (kind=dp), intent(in) :: k
    real (kind=dp), intent(in) :: t_max
    real (kind=dp), intent(in) :: t_min
    integer, intent(in) :: t_num
    real (kind=dp), intent(in) :: x_max
    real (kind=dp), intent(in) :: x_min
    integer, intent(in) :: x_num

    dx = (x_max-x_min)/real(x_num-1, kind=dp)
    dt = (t_max-t_min)/real(t_num-1, kind=dp)

    cfl = k*dt/dx/dx

    write (*, '(a)') ' '
    write (*, '(a,g14.6)') '  CFL stability criterion value = ', cfl

  end subroutine

  subroutine r8mat_write(output_filename, m, n, table)
    implicit none

    integer, intent(in) :: m
    integer, intent(in) :: n

    integer :: j
    character (len=*), intent(in) :: output_filename
    integer :: output_unit_id
    character (len=30) :: string
    real (kind=dp), intent(in) :: table(m, n)

    output_unit_id = 10
    open (unit=output_unit_id, file=output_filename, status='replace')

    write (string, '(a1,i8,a1,i8,a1,i8,a1)') '(', m, 'g', 24, '.', 16, ')'

    do j = 1, n
      write (output_unit_id, string) table(1:m, j)
    end do

    close (unit=output_unit_id)
  end subroutine

  subroutine r8vec_linspace(n, a_first, a_last, a)

    implicit none

    integer, intent(in) :: n
    real (kind=dp), intent(out) :: a(n)
    real (kind=dp), intent(in) :: a_first
    real (kind=dp), intent(in) :: a_last
    integer :: i

    do i = 1, n
      a(i) = (real(n-i,kind=dp)*a_first+real(i-1,kind=dp)*a_last)/ &
        real(n-1, kind=dp)
    end do

  end subroutine

  subroutine r8vec_write(output_filename, n, x)

    implicit none

    integer :: m
    integer, intent(in) :: n

    integer :: j
    character (len=*), intent(in) :: output_filename
    integer :: output_unit_id
    real (kind=dp), intent(in) :: x(n)

    output_unit_id = 11
    open (unit=output_unit_id, file=output_filename, status='replace')

    do j = 1, n
      write (output_unit_id, '(2x,g24.16)') x(j)
    end do

    close (unit=output_unit_id)
  end subroutine

end program
