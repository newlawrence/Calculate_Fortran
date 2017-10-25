module calculate_parser

    use, intrinsic :: iso_c_binding, only: c_ptr, c_null_ptr
    implicit none
    private

    public :: CalculateParser, calculate_get_parser, calculate_get_default_parser

    type :: CalculateParser
        type(c_ptr), private :: handler = c_null_ptr
    contains
        procedure :: check => check
        final :: free
    end type

    interface
        module function calculate_get_parser() result (self)
            type(CalculateParser) :: self
        end function

        module function calculate_get_default_parser() result (self)
            type(CalculateParser) :: self
        end function

        module function check(self)
            class(CalculateParser), intent(in) :: self
            logical :: check
        end function

        module subroutine free(self)
            type(CalculateParser), intent(inout) :: self
        end subroutine
    end interface

end module
