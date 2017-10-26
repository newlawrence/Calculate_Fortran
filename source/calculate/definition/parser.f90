submodule (calculate_parser) parser_definition

    use :: parser_binding
    implicit none

contains

    module procedure calculate_get_parser
        parser%handler = get_parser()
    end procedure

    module procedure calculate_get_default_parser
        parser%handler = get_default_parser()
    end procedure

    module procedure check
        check = 0 .ne. check_parser(self%handler)
    end procedure

    module procedure free
        call free_parser(parser%handler)
    end procedure
end submodule
