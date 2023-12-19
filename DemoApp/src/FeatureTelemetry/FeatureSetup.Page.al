page 70100 "RM Feature Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "RM Feature Setup";
    Caption = 'Feature Setup';

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Enabled; Rec.Enabled)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Some Setup Field"; Rec."Some Setup Field")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}