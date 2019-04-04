# Notes for first session of the NAG Fortran Modernisation Workshop

##### 4th April 2019 at UMIST

## Coding best practices

* Modularise code - reuse and maintaining
* Write code that can be tested
* Use implicit none
* Use whitespace to make code readable
* Use *consistent* formatting
* Agree on a formatting standard amongst your team so you can read each others code.
* Use lowercase for all code, including keywords and intrinsics
* Capitalise first character of subroutines
* Use *labelling* for code blocks
* Use spaces in brackets for calls/conditionals etc. i.e. `if ( x == 1 )` to differentialte from array indices `x(i) = 1`
* Remember that Fortran is **Column Major**, so loop over first index
* Good names are self-describing
* Use verbs for procedure names i.e. `Set_value()`
* Always use *intent*
* If using third party libraries, always capitalise i.e. `MPI_INIT( ierr )`
* Fortran does not short circuit if statements, so `if (( size(vec) == 10 ) .and. ( vec(10) .gt. eps ))` could evaluate either condition first, thus possibly trying to access a non-existent array address. this should be split instead so the size of the array is checked first.
* Array notation is more likely to e vectorised than their do loop equivalent, ie `aero(:) = eng(:)`, not `do i=1,3; aero(i) = eng(i); end do`
* As of F2008, you can use `allocate ( vector(N), stat = ierr, errmsg = "Could not allocate")`
* Use uppercase F90 file extension when using pre-processing

## Good API Characteristics

* Provide high level description of behaviour
* Very long life
* Should be easy to use and difficult to misuse
* Can encapsulate variables
* Use optional arguments where needed to avoid rewrites and users having to update code.
