table 50104 "Bonus Entry"
{
    DataClassification = CustomerContent;
    Caption = 'Bonus Entry';
    
    fields
    {
        field(1;"Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = CustomerContent;
            Editable = false;

        }
        field(2; "Bonus No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Bonus No.';
            Editable = false;
            TableRelation = "Bonus Header";
        }
        field(3; "Document No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Document No.';
            Editable = false;
            TableRelation = "sales invoice header";
        }
        field(4; "Item No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Item No.';
            Editable = false;
            TableRelation = "item";
        }
        field(5; "Posting Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Posting Date';
            Editable = false;
        }
        field(6; "Bonus Amount"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Bonus Amount';
            Editable = false;
        }
    }
    
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
    
}