% Add new Item functional:

addItem(Id, Company, LastDeal, ChangePrice, OpeningPrice, MaxPrice, MinPrice, CountShares, LastUpdate) :-
    assertz(
        shares(
            Id,
            Company,
            LastDeal,
            ChangePrice,
            OpeningPrice,
            MaxPrice,
            MinPrice,
            CountShares,
            LastUpdate
        )
    ).


% Delete exists item by Id:

delItem(Id) :-
    retract(
        shares(
            Id,
            _,
            _,
            _,
            _,
            _,
            _,
            _,
            _
        )
    ).


% Update Item by Id. Set all parametrs:

setItem(Id, Company, LastDeal, ChangePrice, OpeningPrice, MaxPrice, MinPrice, CountShares, LastUpdate) :-
    delItem(Id),
    addItem(
        Id,
        Company,
        LastDeal,
        ChangePrice,
        OpeningPrice,
        MaxPrice,
        MinPrice,
        CountShares,
        LastUpdate
    ).


% Update Item by Id. Set LastDeal parametr:

setLastDealItem(Id, LastDeal):-
    shares(
        Id,
        Company_1,
        _,
        ChangePrice_1,
        OpeningPrice_1,
        MaxPrice_1,
        MinPrice_1,
        CountShares_1,
        LastUpdate_1
    ),

    delItem(Id),
    addItem(
        Id,
        Company_1,
        LastDeal,
        ChangePrice_1,
        OpeningPrice_1,
        MaxPrice_1,
        MinPrice_1,
        CountShares_1,
        LastUpdate_1
    ).


% Update Item by Id. Set ChangePrice parametr:

setChangePriceItem(Id, ChangePrice):-
    shares(
        Id,
        Company_1,
        LastDeal_1,
        _,
        OpeningPrice_1,
        MaxPrice_1,
        MinPrice_1,
        CountShares_1,
        LastUpdate_1
    ),

    delItem(Id),
    addItem(
        Id,
        Company_1,
        LastDeal_1,
        ChangePrice,
        OpeningPrice_1,
        MaxPrice_1,
        MinPrice_1,
        CountShares_1,
        LastUpdate_1
    ).


% Update Item by Id. Set CountShares parametr:

setCountSharesItem(Id, CountShares):-
    shares(
        Id,
        Company_1,
        LastDeal_1,
        ChangePrice_1,
        OpeningPrice_1,
        MaxPrice_1,
        MinPrice_1,
        _,
        LastUpdate_1
    ),

    delItem(Id),
    addItem(
        Id,
        Company_1,
        LastDeal_1,
        ChangePrice_1,
        OpeningPrice_1,
        MaxPrice_1,
        MinPrice_1,
        CountShares,
        LastUpdate_1
    ).


% Update Item by Id. Set LastUpdate parametr:

setLastUpdateItem(Id, LastUpdate):-
    shares(
        Id,
        Company_1,
        LastDeal_1,
        ChangePrice_1,
        OpeningPrice_1,
        MaxPrice_1,
        MinPrice_1,
        CountShares_1,
        _
    ),

    delItem(Id),
    addItem(
        Id,
        Company_1,
        LastDeal_1,
        ChangePrice_1,
        OpeningPrice_1,
        MaxPrice_1,
        MinPrice_1,
        CountShares_1,
        LastUpdate
    ).



% Query questions:

showHeaderLabel() :-
    format(
        '\t~w \t~w \t~w \t~w \t~w \t~w \t~w \t~w \t~w\n',
        [
            "Id",
            "Company",
            "LastDeal",
            "ChangePrice",
            "OpeningPrice",
            "MaxPrice",
            "MinPrice",
            "CountShares",
            "LastUpdate"
        ]
    ).


getItemsAll() :-
    showHeaderLabel(),

    shares(
        Id,
        Company,
        LastDeal,
        ChangePrice,
        OpeningPrice,
        MaxPrice,
        MinPrice,
        CountShares,
        LastUpdate
    ),

    format(
        '\t~w \t~w \t~w \t\t~w \t\t~w \t\t~w \t\t~w \t\t~w \t\t~w\n',
        [
            Id,
            Company,
            LastDeal,
            ChangePrice,
            OpeningPrice,
            MaxPrice,
            MinPrice,
            CountShares,
            LastUpdate
        ]
    ).


getItemsByCompany(Company) :-
    showHeaderLabel(),

    shares(
        Id,
        Company,
        LastDeal,
        ChangePrice,
        OpeningPrice,
        MaxPrice,
        MinPrice,
        CountShares,
        LastUpdate
    ),

    format(
        '\t~w \t~w \t~w \t\t~w \t\t~w \t\t~w \t\t~w \t\t~w \t\t~w\n',
        [
            Id,
            Company,
            LastDeal,
            ChangePrice,
            OpeningPrice,
            MaxPrice,
            MinPrice,
            CountShares,
            LastUpdate
        ]
    ).


getItemsByDate(LastUpdate) :-
    showHeaderLabel(),

    shares(
        Id,
        Company,
        LastDeal,
        ChangePrice,
        OpeningPrice,
        MaxPrice,
        MinPrice,
        CountShares,
        LastUpdate
    ),

    format(
        '\t~w \t~w \t~w \t\t~w \t\t~w \t\t~w \t\t~w \t\t~w \t\t~w\n',
        [
            Id,
            Company,
            LastDeal,
            ChangePrice,
            OpeningPrice,
            MaxPrice,
            MinPrice,
            CountShares,
            LastUpdate
        ]
    ).


getItemsByCountGt(Count) :-
    showHeaderLabel(),

    shares(
        Id,
        Company,
        LastDeal,
        ChangePrice,
        OpeningPrice,
        MaxPrice,
        MinPrice,
        CountShares,
        LastUpdate
    ),

    CountShares > Count,

    format(
        '\t~w \t~w \t~w \t\t~w \t\t~w \t\t~w \t\t~w \t\t~w \t\t~w\n',
        [
            Id,
            Company,
            LastDeal,
            ChangePrice,
            OpeningPrice,
            MaxPrice,
            MinPrice,
            CountShares,
            LastUpdate
        ]
    ).


getItemsByLastDealGtMinPriceAndChangePriceGt(Price) :-
    showHeaderLabel(),

    shares(
        Id,
        Company,
        LastDeal,
        ChangePrice,
        OpeningPrice,
        MaxPrice,
        MinPrice,
        CountShares,
        LastUpdate
    ),

    LastDeal > MinPrice,
    ChangePrice > Price,

    format(
        '\t~w \t~w \t~w \t\t~w \t\t~w \t\t~w \t\t~w \t\t~w \t\t~w\n',
        [
            Id,
            Company,
            LastDeal,
            ChangePrice,
            OpeningPrice,
            MaxPrice,
            MinPrice,
            CountShares,
            LastUpdate
        ]
    ).



% Test questions:
%    1. addItem(1, "Comp. Inc", 100, 3, 80, 120, 60, 1000, "05.04.2023").
%    2. addItem(2, "Comp. Inc", 10, 9, 40, 10, 690, 90, "07.04.2023").
%    3. addItem(3, "Idk. Inc", 70, -2, 40, 10, 90, 90, "07.04.2023").
%    4. addItem(4, "Comp. Inc", 100, -5, 400, 10, 7, 90, "09.04.2023").

        % addItem(99, "Test", 0, 0, 0, 0, 0, 0, "Test").

%    5. shares(1, X1, X2, X3, X4, X5, X6, X7, X8).

%    6. setLastDealItem(99, 200).
%    7. shares(1, X1, X2, X3, X4, X5, X6, X7, X8).

%    8. setChangePriceItem(99, -7).
%    9. shares(1, X1, X2, X3, X4, X5, X6, X7, X8).

%    10. setCountSharesItem(99, 999).
%    11. shares(1, X1, X2, X3, X4, X5, X6, X7, X8).

%    12. setLastUpdateItem(99, "06.04.2023").
%    13. shares(1, X1, X2, X3, X4, X5, X6, X7, X8).

        % delItem(99).
        % shares(1, X1, X2, X3, X4, X5, X6, X7, X8).



%    14. getItemsAll().

%    15. getItemsByCompany("Idk. Inc").

%    16. getItemsByDate("07.04.2023").

%    17. getItemsByCountGt(90).

%    20. getItemsByLastDealGtMinPriceAndChangePriceGt(0).