module calculate_parser

    use, intrinsic :: iso_c_binding, only: CalculateHandler => c_ptr
    implicit none
    private

    public :: CalculateParser, calculate_get_parser, calculate_get_default_parser

    type :: CalculateParser
        type(CalculateHandler), private :: handler
    contains
        procedure :: check
        final :: free
    end type

    interface
        module function calculate_get_parser() result (parser)
            type(CalculateParser) :: parser
        end function

        module function calculate_get_default_parser() result (parser)
            type(CalculateParser) :: parser
        end function

        module function check(self)
            class(CalculateParser), intent(in) :: self
            logical :: check
        end function

        module subroutine free(parser)
            type(CalculateParser), intent(inout) :: parser
        end subroutine
    end interface

end module
