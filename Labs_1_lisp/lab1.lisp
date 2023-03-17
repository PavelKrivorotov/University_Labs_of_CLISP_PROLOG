(
    defun getK (lst)
        "Input list is (A (B C) (D (E) K L))
            Get K"
        (CAR
            (CDR
                (CDR
                    (CAR
                        (CDR
                            (CDR lst)
                        )
                    )
                )
            )
        )
)

(
    defun getE (lst)
        "Input list is (A (B C) (D (E) K L))
            Get E"
        (CAR
            (CAR
                (CDR
                    (CAR
                        (CDR
                            (CDR lst)
                        )
                    )
                )
            )
        )
)

(
    defun getA (lst)
        "Input list is (A (B C) (D (E) K L))
            Get A"
        (CAR lst)
)

(
    defun getB (lst)
        "Input list is (A (B C) (D (E) K L))
            Get B"
        (CAR
            (CAR
                (CDR lst)
            )
        )
)

(
    defun getC (lst)
        "Input list is (A (B C) (D (E) K L))
            Get C"
        (CAR
            (CDR
                (CAR
                    (CDR lst)
                )
            )
        )
)

(
    defun func3 (lst)
        "Input list is (A (B C) (D (E) K L))
            Get (A B C)"
        (CONS
            (getA lst)
            (CONS (getB lst)
                (CONS
                    (getC lst)
                    nil
                )
            )
        )
)

(
    defun getD (lst)
        "Input list is (A (B C) (D (E) K L))
            Get D"
        (CAR
            (CAR
                (CDR
                    (CDR lst)
                )
            )
        )
)

(
    defun getL (lst)
        "Input list is (A (B C) (D (E) K L))
            Get L"
        (CAR
            (CDR
                (CDR
                    (CDR
                        (CAR
                            (CDR
                                (CDR lst)
                            )
                        )
                    )
                )
            )
        )
)

(
    defun func4 (lst)
        "Input list is (A (B C) (D (E) K L))
            Get (K D L)"
        (CONS
            (getK lst)
            (CONS
                (getD lst)
                (CONS
                    (getL lst)
                    nil
                )
            )
        )
)

(
    defun getBC (lst)
        "Input list is (A (B C) (D (E) K L))
            Get (B C)"
        (CAR
            (CDR lst)
        )
)

(
    defun func5 (lst)
        "Input list is (A (B C) (D (E) K L))
            Get ((B C) K)"
        (CONS
            (getBC lst)
            (CONS
                (getK lst)
                nil
            )
        )
)

(
    defun func6 (lst)
        "Input list is (A (B C) (D (E) K L))
            Get (C A K)"
        (CONS
            (getC lst)
            (CONS
                (getA lst)
                (CONS
                    (getK lst)
                    nil
                )
            )
        )
)