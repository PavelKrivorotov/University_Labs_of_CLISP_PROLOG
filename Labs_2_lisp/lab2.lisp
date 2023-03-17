(
    defun getReverse (new old)
    "Return reverse list..."
    (cond
        ((not old) (return-from getReverse new))
        (T (getReverse (CONS (CAR old) new) (CDR old)))
    )
)

(
    defun getLst (new old n k ind)
    "Return list in list..."
    (cond
        ((= ind (+ n k)) (return-from getLst (getReverse nil new)))
        ((< ind n) (getLst new (CDR old) n k (+ ind 1)))
        (T (getLst (CONS (CAR old) new) (CDR old) n k (+ ind 1)))
    )
)

(
    defun getUnionLst (new lst1 lst2)
    "Return union of lst1 and lst2"
    (cond
        (lst1 (getUnionLst (CONS (CAR lst1) new) (CDR lst1) lst2))
        (lst2 (getUnionLst (CONS (CAR lst2) new) lst1 (CDR lst2)))
        (T (return-from getUnionLst (getReverse nil new)))
    )
)

(
    defun getVariant (new lst lst-copy n k m ind)
    "Return newLst"
    (cond
        ((< ind n) (getVariant (CONS (CAR lst) new) (CDR lst) lst-copy n k m (+ ind 1)))
        ((< ind (+ n k)) (getVariant new (CDR lst) lst-copy n k m (+ ind 1)))
        ((< ind (+ m 1)) (getVariant (CONS (CAR lst) new) (CDR lst) lst-copy n k m (+ ind 1)))
        (T (return-from getVariant (getUnionLst nil (getReverse nil new) (getUnionLst nil (getLst nil lst-copy n k 1) lst))))
    )
)