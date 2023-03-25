(defvar lst1 nil)

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


; Stack functional
(
    defun getReverse (new old)
    "Return reverse list..."
    (cond
        ((not old) (return-from getReverse new))
        (T (getReverse (CONS (CAR old) new) (CDR old)))
    )
)

(
    defun addToStack (stack item)
    "Add item to stack (end-position). Return stack."
    (cond
        (
            (not item)
            stack
        )
        
        (
            T
            (getReverse
                nil
                (CONS
                    item
                    (getReverse nil stack)
                )
            )
        )
    )
)

(
    defun getFromStack (stack)
    "Return item at (end-position)."
    (CAR
        (getReverse nil stack)
    )
)

(
    defun delFromStack (stack)
    "Return stack without element at (end-position)"
    (getReverse
        nil
        (CDR
            (getReverse nil stack)
        )
    )
)

(
    defun createStackItem (row-label row row-header-label tmp-lst)
    "Create stack item."
    (cond
        (
            (not (or row row-header-label))
            nil
        )
        
        (
            T
            (CONS
                row-label
                (CONS
                    row
                    (CONS
                        row-header-label
                        (CONS
                            tmp-lst
                            nil
                        )
                    )
                )
            )
        )
    )
)

(
    defun getInStckItem (stack-item index ind)
    "Return value at position at index in stack-item"
    (cond
        ((> ind index) nil)
        ((equal ind index) (CAR stack-item))
        (T (getInStckItem (CDR stack-item) index (+ ind 1)))
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
    defun existsInLst (lst station)
    "Return true if value in lst, else nil"
    (cond
        ((not lst) nil)
        ((equal (CAR lst) station) T)
        (T (existsInLst (CDR lst) station))
    )
)

(
    defun addToTmpLst (lst station value)
    "Return list with new station and change value of travel"
    (cond
        (
            (not lst)
            (CONS
                (CONS station nil)
                (CONS value nil)
            )
        )

        (
            T
            (CONS
                (getReverse
                    nil
                    (CONS
                        station
                        (getReverse nil (CAR lst))
                    )
                )
                (CONS
                    (+
                        value
                        (CAR
                            (CDR lst)
                        )
                    )
                    nil
                )
            )
        )
    )
)

(
    defun getRowByLabel (lst-withoter-header-label station)
    "Get list where 1st element = station. Else nil"
    (cond
        ((not lst-withoter-header-label) nil)

        (
            (equal
                (CAR
                    (CAR lst-withoter-header-label)
                )
                station
            )
            (CAR lst-withoter-header-label)
        )

        (
            T
            (getRowByLabel
                (CDR lst-withoter-header-label)
                station
            )
        )
    )
)

(
    defun iterFromLst (new-lst lst stack station-to)
    "Return all travels between station-from station-to."
    ; (print "new-lst:")
    ; (print new-lst)
    ; (terpri)

    ; (print "lst:")
    ; (print lst)
    ; (terpri)

    ; (print "stack:")
    ; (print stack)
    ; (terpri)

    ; (print "station-to:")
    ; (print station-to)
    ; (terpri)
    ; (terpri)
    ; (terpri)

    (cond
        ; Stack is nil
        ((not stack) new-lst)
        
        ; Value is nil
        (
            (not
                (CAR
                    (getInStckItem
                        (getFromStack stack)
                        1
                        0
                    )
                )
            )
            
            (iterFromLst
                new-lst
                lst
                (addToStack
                    (delFromStack stack)
                    (createStackItem
                        (getInStckItem
                            (getFromStack stack)
                            0
                            0
                        )
                        (CDR
                            (getInStckItem
                                (getFromStack stack)
                                1
                                0
                            )
                        )
                        (CDR
                            (getInStckItem
                                (getFromStack stack)
                                2
                                0
                            )
                        )
                        (getInStckItem
                            (getFromStack stack)
                            3
                            0
                        )
                    )
                )
                station-to
            )
        )
        
        ; Value not nil and is to-station
        (
            (and
                (CAR
                    (getInStckItem
                        (getFromStack stack)
                        1
                        0
                    )
                )
                (equal
                    (CAR
                        (getInStckItem
                            (getFromStack stack)
                            2
                            0
                        )
                    )
                    station-to
                )
            )

            (iterFromLst
                (addToLst
                    new-lst
                    (addToTmpLst
                        (getInStckItem
                            (getFromStack stack)
                            3
                            0
                        )
                        station-to
                        (CAR
                            (getInStckItem
                                (getFromStack stack)
                                1
                                0
                            )
                        )
                    )
                )

                lst
                (addToStack
                    (delFromStack stack)
                    (createStackItem
                        (getInStckItem
                            (getFromStack stack)
                            0
                            0
                        )
                        
                        (CDR
                            (getInStckItem
                                (getFromStack stack)
                                1
                                0
                            )
                        )
                        (CDR
                            (getInStckItem
                                (getFromStack stack)
                                2
                                0
                            )
                        )
                        (getInStckItem
                            (getFromStack stack)
                            3
                            0
                        )
                    )
                )
                station-to
            )
        )

        ; Value exists in tmp-lst. Brake cicle.
        (
            (and
                (CAR
                    (getInStckItem
                        (getFromStack stack)
                        1
                        0
                    )
                )
                (existsInLst
                    (CAR
                        (getInStckItem
                            (getFromStack stack)
                            3
                            0
                        )
                    )
                    (CAR
                        (getInStckItem
                            (getFromStack stack)
                            2
                            0
                        )
                    )
                )
            )

            (iterFromLst
                new-lst
                lst
                (addToStack
                    (delFromStack stack)
                    (createStackItem
                        (getInStckItem
                            (getFromStack stack)
                            0
                            0
                        )
                        (CDR
                            (getInStckItem
                                (getFromStack stack)
                                1
                                0
                            )
                        )
                        (CDR
                            (getInStckItem
                                (getFromStack stack)
                                2
                                0
                            )
                        )
                        (getInStckItem
                            (getFromStack stack)
                            3
                            0
                        )
                    )
                )
                station-to
            )
        )

        ; Value not nil and is not to-station
        (
            T

            (iterFromLst
                new-lst
                lst
                
                (addToStack
                    (addToStack
                        (delFromStack stack)
                        (createStackItem
                            (getInStckItem
                                (getFromStack stack)
                                0
                                0
                            )
                            (CDR
                                (getInStckItem
                                    (getFromStack stack)
                                    1
                                    0
                                )
                            )
                            (CDR
                                (getInStckItem
                                    (getFromStack stack)
                                    2
                                    0
                                )
                            )
                            (getInStckItem
                                (getFromStack stack)
                                3
                                0
                            )
                        )
                    )
                    
                    
                    (createStackItem
                        (CAR
                            (getInStckItem
                                (getFromStack stack)
                                2
                                0
                            )
                        )
                        (CDR
                            (getRowByLabel
                                (CDR lst)
                                (CAR
                                    (getInStckItem
                                        (getFromStack stack)
                                        2
                                        0
                                    )
                                )
                            )
                        )
                        (CDR
                            (CAR lst)
                        )
                        (addToTmpLst
                            (getInStckItem
                                (getFromStack stack)
                                3
                                0
                            )
                            (CAR
                                (getInStckItem
                                    (getFromStack stack)
                                    2
                                    0
                                )
                            )
                            (CAR
                                (getInStckItem
                                    (getFromStack stack)
                                    1
                                    0
                                )
                            )
                        )
                    )
                )
                
                station-to
            )
        )
    )
)

(
    defun getTravels (lst station-from station-to)
    "Return the list of all travels between station-from to station-to"
    (iterFromLSt
        nil
        lst
        (addToStack
            nil
            (createStackItem
                (CAR
                    (getRowByLabel (CDR lst) station-from)
                )
                (CDR
                    (getRowByLabel (CDR lst) station-from)
                )
                (CDR
                    (CAR lst)
                )
                (addToTmpLst nil station-from 0)
            )
        )
        station-to
    )
)

(
    defun getMinimalTravels (new-lst travels-lst)
    "Return new-lst with minimal travel(s)."
    (cond
        (
            (not travels-lst)
            new-lst
        )
        
        (
            (not new-lst)
            (getMinimalTravels
                (addToLst
                    new-lst
                    (CAR travels-lst)
                )
                (CDR travels-lst)
            )
        )
        
        (
            (<
                (CAR
                    (CDR
                        (CAR travels-lst)
                    )
                )
                (CAR
                    (CDR
                        (CAR new-lst)
                    )
                )
            )
            (getMinimalTravels
                (addToLst nil (CAR travels-lst))
                (CDR travels-lst)
            )
        )
        
        (
            (equal
                (CAR
                    (CDR
                        (CAR travels-lst)
                    )
                )
                (CAR
                    (CDR
                        (CAR new-lst)
                    )
                )
            )
            (getMinimalTravels
                (addToLst new-lst (CAR travels-lst))
                (CDR travels-lst)
            )
        )
        
        (
            T
            (getMinimalTravels
                new-lst
                (CDR travels-lst)
            )
        )
    )
)



(print
    "ALL travels:"
)
(print
    (getTravels lst1 "5" "3")
)


(terpri)
(print
    "Minimal travels:"
)
(print
    (getMinimalTravels
        nil
        (getTravels lst1 "5" "3")
    )
)