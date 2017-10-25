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
