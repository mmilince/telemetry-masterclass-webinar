pageextension 70100 "RM Customer List" extends "Customer List"
{
    actions
    {
        addfirst(processing)
        {
            action(DemoFeature)
            {
                ApplicationArea = All;
                Promoted = true;
                Image = Document;
                Caption = 'Demo Feature';

                trigger OnAction()
                var
                    FeatureTelemetryMgt: Codeunit "RM Telemetry Feature Mgt.";
                    FeatureSetup: Record "RM Feature Setup";
                begin
                    FeatureSetup.FindFirst();
                    if not FeatureSetup.Enabled then
                        exit;

                    Message('Voila! New feature is used!');
                    FeatureTelemetryMgt.UsedDemoFeature();
                end;
            }
        }
    }
}