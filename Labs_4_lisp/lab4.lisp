(defvar railway-table nil)
(defvar railway-struct-label "railway-struct-")

(defstruct railway-struct
    flight-number
    train-number
    station-from
    station-to
    date-from
    date-to
)


; Declare functions for railway-table (add, set, del):
(
    defun addToTable (
        table
        flight-number-1
        train-number-1
        station-from-1
        station-to-1
        date-from-1
        date-to-1
    )
    "Add new item in railway-table."
    (set
        `railway-table
        (append
            railway-table
            (list
                (make-railway-struct
                    :flight-number  flight-number-1
                    :train-number   train-number-1
                    :station-from   station-from-1
                    :station-to     station-to-1
                    :date-from      date-from-1
                    :date-to        date-to-1
                )
            )
        )
    )
)

(
    defun getFromTable (table flight-number-1)
    "Return item, where item-flight-number = flight-number-1."
    (cond
        (
            (not (CAR table))
            nil
        )
        
        (
            (equal
                flight-number-1
                (railway-struct-flight-number (CAR table))
            )
            (CAR table)
        )
        
        (
            T
            (getFromTable (CDR table) flight-number-1)
        )
    )
)

(
    defun setToTable (
        table
        flight-number-1
        fields-lst
        values-lst
    )
    "Set from item, where item-flight-number = flight-number-1. On fields fields-lst values-lst."
    (cond
        (
            (not (CAR fields-lst))
            (return-from setToTable nil)
        )
        
        (
            (equal
                "train-number"
                (CAR fields-lst)
            )
            
            (setf
                (railway-struct-train-number
                    (getFromTable table flight-number-1)
                )
                (CAR values-lst)
            )
        )
        
        (
            (equal
                "station-from"
                (CAR fields-lst)
            )
            
            (setf
                (railway-struct-station-from
                    (getFromTable table flight-number-1)
                )
                (CAR values-lst)
            )
        )
        
        (
            (equal
                "station-to"
                (CAR fields-lst)
            )
            
            (setf
                (railway-struct-station-to
                    (getFromTable table flight-number-1)
                )
                (CAR values-lst)
            )
        )
        
        (
            (equal
                "date-from"
                (CAR fields-lst)
            )
            
            (setf
                (railway-struct-date-from
                    (getFromTable table flight-number-1)
                )
                (CAR values-lst)
            )
        )
        
        (
            (equal
                "date-to"
                (CAR fields-lst)
            )
            
            (setf
                (railway-struct-date-to
                    (getFromTable table flight-number-1)
                )
                (CAR values-lst)
            )
        )
        
        (
            T
            (return-from setToTable nil)
            
            ; (setf
            ;     (funcall
            ;         (intern
            ;             (string-upcase
            ;                 (concatenate `STRING railway-struct-label (CAR fields-lst))
            ;             )
            ;         )
            ;         (getFromTable table flight-number-1)
            ;     )
            ;     (CAR values-lst)
            ; )
        )
    )
    
    (setToTable table flight-number-1 (CDR fields-lst) (CDR values-lst))
)

(
    defun delFromTable (new-table table flight-number-1)
    "Delete item, where item-flight-number = flight-number-1."
    (cond
        (
            (not (CAR table))
            (set `railway-table (reverse new-table))
        )
        
        (
            (equal
                flight-number-1
                (railway-struct-flight-number (CAR table))
            )
            (delFromTable
                new-table
                (CDR table)
                flight-number-1
            )
        )
        
        (
            T
            (delFromTable
                (CONS (CAR table) new-table)
                (CDR table)
                flight-number-1
            )
        )
    )
)


; Declare functions for stations



; Insertion from railway-table:
(addToTable
    railway-table
    1
    "AAA"
    "Saint-Petersburg"
    "Moscow"
    "10.01.2023"
    "11.01.2023"
)

(addToTable
    railway-table
    2
    "BBB-002"
    "Moscow"
    "Saint-Petersburg"
    "10.01.2023"
    "11.01.2023"
)

(addToTable
    railway-table
    3
    "LOL-100"
    "Saint-Petersburg"
    "Ivanovo"
    "11.01.2023"
    "13.01.2023"
)


; (delFromTable
;     nil
;     railway-table
;     1
; )


; (print
;     (getFromTable railway-table 3)
; )



(print
    railway-table
)
(terpri)
(terpri)



(setToTable
    railway-table
    1
    `(
        "train-number"
        "station-from"
        "station-to"
        "date-from"
        "date-to"
    )
    `(
        "KOKOKOK"
        "NEW-STATION"
        "OKEY"
        "00.00.0000"
        "99.99.9999"
    )
)


(print
    railway-table
)
