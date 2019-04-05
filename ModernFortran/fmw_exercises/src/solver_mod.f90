module solver_mod
  use :: types_mod, only: dp

  implicit none

  public :: fd1d_heat_explicit

contains

  subroutine fd1d_heat_explicit(x, t, dt, cfl, h, h_new)
    implicit none

    real (kind=dp), intent(in) :: cfl
    real (kind=dp), intent(in) :: dt
    real (kind=dp), dimension(:), intent(in) :: h
    real (kind=dp), dimension(:), intent(out) :: h_new
    integer :: j, n
    real (kind=dp), intent(in) :: t
    real (kind=dp), dimension(:), intent(in) :: x
    real (kind=dp) :: f(size(x))

    n = size(x)

    do j = 1, size(x)
      f(j) = func(j, x)
    end do

    h_new(1) = 0.0e+00_dp

    do j = 2, n - 1
      h_new(j) = h(j) + dt*f(j) + cfl*(h(j-1)-2.0e+00_dp*h(j)+h(j+1))
    end do

! set the boundary conditions again
    h_new(1) = 90.0e+00_dp
    h_new(n) = 70.0e+00_dp
  end subroutine

end module solver_mod
