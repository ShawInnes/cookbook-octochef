
describe port(80) do
  it { should be_listening }
  its('protocols') { should eq ['tcp'] }
end
