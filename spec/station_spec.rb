require "station"

describe Station do
    # let(:subject) { describe_class.new(name: name, zone: zone)}
    let(:name) {double :name_station}
    let(:zone) {double :zone}

        it "#outputs the station and zone" do
            stations = Station.new(name, zone)
           expect(stations.info).to eq(":zone" ":name")
        end
end