(defvar railway-table nil)
(defvar ticket-table nil)


(defstruct railway-struct
    flight-number
    train-number
    station-from
    station-to
    date-from
    date-to
)

(setf
    ticket-table
    (make-sequence `LIST 15)
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
            
            ; Add functional
            (delTicketMultiple ticket-table flight-number-1)
            
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


; Declare functions for tickets:
(
    defun addTicket (ticket-table flight-number-1)
    "Add ticket to ticket-table."
    (cond
        (
            (not (CDR ticket-table))
            nil
        )
        
        (
            (not (CAR ticket-table))
            (setf
                (CAR ticket-table)
                (list
                    flight-number-1
                    (random 1000000000)
                )
            )
        )
        
        (
            T
            (addTicket (CDR ticket-table) flight-number-1)
        )
    )
)

(
    defun delTicket (ticket-table ticket-number-1)
    "Delete ticket by ticket-number."
    (cond
        (
            (not (CDR ticket-table))
            nil
        )
        
        (
            (equal
                ticket-number-1
                (CAR
                    (CDR
                        (CAR ticket-table)
                    )
                )
            )
            (setf
                (CAR ticket-table)
                nil
            )
        )
        
        (
            T
            (delTicket (CDR ticket-table) ticket-number-1)
        )
    )
)

(
    defun delTicketMultiple (ticket-table flight-number-1)
    "Delete ticket by flight-number."
    (cond
        (
            (not (CDR ticket-table))
            nil
        )
        
        (
            (equal
                flight-number-1
                (CAR
                    (CAR ticket-table)
                )
            )
            
            (setf
                (CAR ticket-table)
                nil
            )
            (delTicketMultiple (CDR ticket-table) flight-number-1)
        )
        
        (
            T
            (delTicketMultiple (CDR ticket-table) flight-number-1)
        )
    )
)


;Declare functions for search:




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

(addToTable
    railway-table
    4
    ""
    ""
    ""
    ""
    ""
)


(print
    "Add to railway-table new railways:"
)
(terpri)
(print
    railway-table
)



; Update from railway-table:
(setToTable
    railway-table
    4
    `(
        "train-number"
        "station-from"
        "station-to"
        "date-from"
        "date-to"
    )
    `(
        "QQQ-200"
        "Saint-Petersburg"
        "Pscov"
        "14.01.2023"
        "14.01.2023"
    )
)

(terpri)
(terpri)
(terpri)
(print
    "Update from railway, where flight-number = 4"
)
(terpri)
(print
    railway-table
)


; Add tickets to ticket-table:
(addTicket ticket-table 1)
(addTicket ticket-table 1)
(addTicket ticket-table 1)
(addTicket ticket-table 2)
(addTicket ticket-table 2)
(addTicket ticket-table 3)
(addTicket ticket-table 4)
(addTicket ticket-table 4)


(terpri)
(terpri)
(terpri)
(print
    "Add tickets:"
)
(terpri)
(print
    ticket-table
)



; Delete ticket by ticket-number:
(delTicket ticket-table 277986140)


(terpri)
(terpri)
(terpri)
(print
    "Delete ticket by ticket-number, where ticket-number = 277986140:"
)
(terpri)
(print
    ticket-table
)



; Delete railway, where flight-number = 1:
(delFromTable nil railway-table 1)


(terpri)
(terpri)
(terpri)
(print
    "Delete railway, where flight-number = 1:"
)
(terpri)
(print
    "Now railway-table:"
)
(terpri)
(print
    railway-table
)
(terpri)
(print
    "Now ticket-table:"
)
(terpri)
(print
    ticket-table
)



; Search by railway-table and ticket-table:
(
    defun search-railways-by-station-from (lst station-from)
    "..."
    (mapcan
        (function
            (lambda
                (railway)
                (cond
                    (
                        (equal
                            station-from
                            (railway-struct-station-from railway)
                        )
                        (list railway)
                    )
                    
                    (T nil)
                )
            )
        )
        lst
    )
)

(
    defun search-railways-by-station-to (lst station-to)
    "..."
    (mapcan
        (function
            (lambda
                (railway)
                (cond
                    (
                        (equal
                            station-to
                            (railway-struct-station-to railway)
                        )
                        (list railway)
                    )
                    
                    (T nil)
                )
            )
        )
        lst
    )
)

(
    defun search-railways-by-stations (lst station-from station-to)
    "..."
    (mapcan
        (function
            (lambda
                (railway)
                (cond
                    (
                        (and
                            (equal
                                station-from
                                (railway-struct-station-from railway)
                            )
                            (equal
                                station-to
                                (railway-struct-station-to railway)
                            )
                        )
                        (list railway)
                    )
                    
                    (T nil)
                )
            )
        )
        lst
    )
)



(
    defun search-tickets-by-flight-number (lst flight-number)
    "..."
    (mapcan
        (function
            (lambda
                (lst)
                (cond
                    (
                        (equal
                            flight-number
                            (CAR lst)
                        )
                        (CDR lst)
                    )
                    
                    (T nil)
                )
            )
        )
        ; ticket-table
        lst
    )
)

(
    defun search-tickets-by-date-from (lst1 lst2 date-from)
    "..."
    (mapcan
        (function
            (lambda
                (lst)
                (cond
                    (
                        (equal lst nil)
                        nil
                    )
                    
                    (
                        (equal
                            date-from
                            (railway-struct-date-from
                                (getFromTable
                                    lst1
                                    (CAR lst)
                                )
                            )
                        )
                        (CDR lst)
                    )
                    
                    (T nil)
                )
            )
        )
        lst2
    )
)



(terpri)
(terpri)
(terpri)
(print
    "Serach from railway-table:"
)
(terpri)

(print
    "Where station-from = Saint-Petersburg:"
)
(terpri)

(print
    (search-railways-by-station-from railway-table "Saint-Petersburg")
)
(terpri)

(print
    "Where station-to = Ivanovo:"
)
(terpri)

(print
    (search-railways-by-station-to railway-table "Ivanovo")
)
(terpri)

(print
    "Where station-from = Saint-Petersburg, station-to = Pscov:"
)
(terpri)

(print

    (search-railways-by-stations railway-table "Saint-Petersburg" "Pscov" )
)



(terpri)
(terpri)
(terpri)
(print
    "Search tickets, where flight-number = 4:"
)

(terpri)
(print
    (search-tickets-by-flight-number ticket-table 4)
)

(terpri)

(print
    "Search tickets where date-from = 11.01.2023:"
)
(terpri)

(print
    (search-tickets-by-date-from railway-table ticket-table "11.01.2023")
)
