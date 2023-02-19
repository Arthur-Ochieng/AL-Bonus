report 50100 "Bonus Overview"
{
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Bonus Overview';
    ApplicationArea = All;
    DefaultLayout = Word;
    WordLayout = 'BonusOverview.report.Docx';
    
    dataset
    {
        dataitem("Bonus Header"; "Bonus Header")
        {
            RequestFilterFields = "No.", "Customer No.";
            column(No_; "No.")
            {}
            column(Customer_No_; "Customer No.")
            {}
            column(Starting_Date;Format("Starting Date", 0))
            {}
            column(Ending_Date;Format("Ending Date", 0))
            {}
            column(BonusNoCaptionLbl; BonusNoCaptionLbl)
            {}
            column(CustomerNoCaptionLbl; CustomerNoCaptionLbl)
            {}
            column(PostingDateCaptionLbl; PostingDateCaptionLbl)
            {}
            column(DocumentNoCaptionLbl; DocumentNoCaptionLbl)
            {}
            column(BonusAmountCaptionLbl; BonusAmountCaptionLbl)
            {}
            column(ItemNoCaptionLbl; ItemNoCaptionLbl)
            {}
            column(StartingDateCaptionLbl; StartingDateCaptionLbl)
            {}
            column(EndingDateCaptionLbl; EndingDateCaptionLbl)
            {}
            dataitem("Bonus Entry"; "Bonus Entry")
            {
                DataItemLink = "Bonus No." = field ("No.");
                RequestFilterFields = "Posting Date";

                column(Document_No_; "Document No.")
                {}
                column(Posting_Date; Format("Posting Date", 0))
                {}
                column(Item_No_; "Item No.")
                {}
                column(Bonus_Amount;"Bonus Amount")
                {}
            }
        trigger OnAftergetRecord()
        var
            BonusEntry: Record "Bonus Entry";
        
        begin
            BonusEntry.CopyFilters("Bonus Entry");
            BonusEntry.SetRange("Bonus No.", "No.");
            BonusEntry.CalcSums("Bonus Amount");
            AmountSum := BonusEntry."Bonus Amount";
        end;
        }
    }

    var
        AmountSum: Decimal;
    
    var 
        BonusNoCaptionLbl: Label'Bonus No.';
        CustomerNoCaptionLbl: label 'Customer No.';
        PostingDateCaptionLbl: label 'Posting Date';
        DocumentNoCaptionLbl: label 'Document No.';
        BonusAmountCaptionLbl: label 'Amount';
        ItemNoCaptionLbl: label 'Item No.';
        StartingDateCaptionLbl: label 'Starting Date';
        EndingDateCaptionLbl: label 'Ending Date';
}