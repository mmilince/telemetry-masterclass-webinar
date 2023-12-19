pageextension 70101 "RM Item List" extends "Item List"
{
    actions
    {
        addfirst(processing)
        {
            action(DemoCustomTelemetry)
            {
                ApplicationArea = All;
                Promoted = true;
                Image = Document;
                Caption = 'Demo Custom Telemetry';

                trigger OnAction()
                var
                    CustomTelemetryMgt: Codeunit "RM Custom Telemetry Mgt";
                    StartTime: DateTime;
                begin
                    StartTime := CurrentDateTime();

                    if Page.RunModal(Page::"Item Card", Rec) = Action::LookupOK then
                        Message('Custom telemetry message!');

                    CustomTelemetryMgt.LogCustomTelemetry(StartTime);
                end;
            }
        }
    }
}