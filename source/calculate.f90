module parser_binding

    use, intrinsic :: iso_c_binding
    implicit none

    interface
        function get_parser() bind(c, name='_calculate_get_parser')
            import :: c_ptr
            type(c_ptr) :: get_parser
        end function

        function get_default_parser() bind(c, name='_calculate_get_default_parser')
            import :: c_ptr
            type(c_ptr) :: get_default_parser
        end function

        function check_parser(handler) bind(c, name='_calculate_check_parser')
            import :: c_ptr, c_int
            type(c_ptr), value :: handler
            integer(kind=c_int) :: check_parser
        end function

        subroutine free_parser(handler) bind(c, name='_calculate_free_parser')
            import :: c_ptr
            type(c_ptr), value :: handler
        end subroutine
    end interface

end module


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


submodule (calculate_parser) parser_implementation

    use :: parser_binding
    implicit none

contains

    module procedure calculate_get_parser
        self%handler = get_parser()
    end procedure

    module procedure calculate_get_default_parser
        self%handler = get_default_parser()
    end procedure

    module procedure check
        check = 0 .ne. check_parser(self%handler)
    end procedure

    module procedure free
        call free_parser(self%handler)
    end procedure
end submodule


module calculate

    use calculate_parser

end module
