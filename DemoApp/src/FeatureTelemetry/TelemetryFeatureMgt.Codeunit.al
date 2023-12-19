codeunit 70101 "RM Telemetry Feature Mgt."
{
    procedure DiscoverDemoFeature()
    var
        FeatureTelemetry: Codeunit "Feature Telemetry";
    begin
        FeatureTelemetry.LogUptake('DEMO0001', 'Demo feature', Enum::"Feature Uptake Status"::Discovered);
    end;

    procedure SetUpDemoFeature()
    var
        FeatureTelemetry: Codeunit "Feature Telemetry";
    begin
        FeatureTelemetry.LogUptake('DEMO0001', 'Demo feature', Enum::"Feature Uptake Status"::"Set up");
    end;

    procedure UsedDemoFeature()
    var
        FeatureTelemetry: Codeunit "Feature Telemetry";
    begin
        FeatureTelemetry.LogUptake('DEMO0001', 'Demo feature', Enum::"Feature Uptake Status"::Used);
    end;

    procedure UndiscoverDemoFeature()
    var
        FeatureTelemetry: Codeunit "Feature Telemetry";
    begin
        FeatureTelemetry.LogUptake('DEMO0001', 'Demo feature', Enum::"Feature Uptake Status"::Undiscovered);
    end;
}