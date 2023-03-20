(defvar lst1 nil)
(defvar lst2 nil)

(set `lst1 `(
        (nil    "1"     "2"     "3"     "4"     "5"     "6"     "7" )
        ("1"    nil     nil     nil     nil     nil     nil     20  )
        ("2"    nil     nil     20      nil     nil     nil     10  )
        ("3"    nil     20      nil     15      nil     nil     nil )
        ("4"    nil     nil     15      nil     5       nil     7   )
        ("5"    nil     nil     nil     5       nil     40      35  )
        ("6"    nil     nil     nil     nil     40      nil     12  )
        ("7"    20      10      nil     7       35      12      nil )
    )
)

(set `lst2 `(
        (nil    "1"     "2"     "3"     "4"     "5"     "6"     "7" )
        ("1"    nil     5     nil     nil     nil     nil     20  )
        ("2"    5     nil     20      nil     nil     nil     10  )
        ("3"    nil     20      nil     15      nil     nil     nil )
        ("4"    nil     nil     15      nil     5       nil     7   )
        ("5"    nil     nil     nil     5       nil     40      35  )
        ("6"    nil     nil     nil     nil     40      nil     12  )
        ("7"    20      10      nil     7       35      12      nil )
    )
)


(
    defun createItem (row-label column-label value)
    "Create list: (row-label column-label value)"
    (cond
        (value
            (CONS
                row-label
                (CONS
                    column-label
                    (CONS
                        value
                        nil
                    )
                )
            )
        )

        (T nil)
    )
)

(
    defun addToLst (lst item)
    "Append new item to lst"
    (cond
        (item
            (CONS item lst)
        )

        (T lst)
    )
)

(
    defun travelByColumns (new-lst row-label without-label-row header-lst)
    "Return new-lst..."
    ; (print row-label)
    ; (print without-label-row)
    ; (print (CAR header-lst))
    ; (terpri)

    (cond
        (without-label-row
            (travelByColumns
                (addToLst
                    new-lst
                    (createItem
                        row-label
                        (CAR header-lst)
                        (CAR without-label-row)
                    )
                )

                row-label
                (CDR without-label-row)
                (CDR header-lst)
            )
        )

        (T new-lst)
    )
)

(
    defun travelByRows (new-lst without-header-lst header-lst)
    "Return new-lst. Travel by all rows in without-header-lst"
    ; (print new-lst)
    ; (print without-header-lst)
    ; (prin1 header-lst)
    ; (terpri)

    (cond
        (without-header-lst
            (travelByRows
                (travelByColumns
                    new-lst
                    (CAR
                        (CAR without-header-lst)
                    )

                    (CDR
                        (CAR without-header-lst)
                    )

                    (CDR header-lst)
                )
                (CDR without-header-lst)
                header-lst
            )
        )

        (T new-lst)
    )
)

(
    defun getValueInItem (item)
    "Return the Value in item"
    (CAR
        (CDR
            (CDR item)
        )
    )
)

(
    defun getMinimalItems (new-lst lst)
    "Return the minimal items in lst"
    (cond
        ((not lst) new-lst)
        ((not new-lst) (getMinimalItems (addToLst new-lst (CAR lst)) (CDR lst)))
        ((< (getValueInItem (CAR lst)) (getValueInItem (CAR new-lst)))
            (getMinimalItems (addToLst nil (CAR lst)) (CDR lst))
        )

        ((= (getValueInItem (CAR lst)) (getValueInItem (CAR new-lst)))
            (getMinimalItems (addToLst new-lst (CAR lst)) (CDR lst))
        )

        (T (getMinimalItems new-lst (CDR lst)))
    )
)

(
    defun getTravels (new-lst lst)
    "Return new-list of minimal travels"
    (travelByRows nil (CDR lst) (CAR lst))
)

(
    defun getMinimalTravels (lst)
    "Return the minimal travels in lst"
    (getMinimalItems nil (getTravels nil lst))
)


(print "List of the distance  1:")
(print lst1)
(terpri)

(print "List of all travels between station:")
(print (getTravels nil lst1) )
(terpri)

(print "List of minimal travels in all travels:")
(print (getMinimalTravels lst1))
(terpri)


(terpri)
(print "List of the distance  2:")
(print lst1)
(terpri)

(print "List of all travels between station:")
(print (getTravels nil lst2) )
(terpri)

(print "List of minimal travels in all travels:")
(print (getMinimalTravels lst2))
(terpri)