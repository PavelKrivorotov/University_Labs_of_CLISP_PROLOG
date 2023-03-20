(defvar lst nil)
(set `lst `(A (B C) (D (E) K L)))


(
    defun getK (lst)
        "Input list is (A (B C) (D (E) K L)). Get K"
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
        "Input list is (A (B C) (D (E) K L)). Get E"
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
        "Input list is (A (B C) (D (E) K L)). Get A"
        (CAR lst)
)

(
    defun getB (lst)
        "Input list is (A (B C) (D (E) K L)). Get B"
        (CAR
            (CAR
                (CDR lst)
            )
        )
)

(
    defun getC (lst)
        "Input list is (A (B C) (D (E) K L)). Get C"
        (CAR
            (CDR
                (CAR
                    (CDR lst)
                )
            )
        )
)

(
    defun getD (lst)
        "Input list is (A (B C) (D (E) K L)). Get D"
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
        "Input list is (A (B C) (D (E) K L)). Get L"
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
    defun getBC (lst)
        "Input list is (A (B C) (D (E) K L)). Get (B C)"
        (CAR
            (CDR lst)
        )
)

(
    defun getABC (lst)
        "Input list is (A (B C) (D (E) K L)). Get (A B C)"
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
    defun getKDL (lst)
        "Input list is (A (B C) (D (E) K L)). Get (K D L)"
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
    defun getBCK (lst)
        "Input list is (A (B C) (D (E) K L)). Get ((B C) K)"
        (CONS
            (getBC lst)
            (CONS
                (getK lst)
                nil
            )
        )
)

(
    defun getCAK (lst)
        "Input list is (A (B C) (D (E) K L)). Get (C A K)"
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


(print "Output K")
(print (getK lst))
(terpri)

(print "Output L")
(print (getL lst))
(terpri)

(print "Output (A B C)")
(print (getABC lst))
(terpri)

(print "Output (K D L)")
(print (getKDl lst))
(terpri)

(print "Output ((B C) K)")
(print (getBCK lst))
(terpri)

(print "Output (C A K)")
(print (getCAK lst))
(terpri)