equire 'spec_helper_system'
describe 'basic tests:' do
  # Here we create the var 'pp' to be later tested
  let(pp) do
    pp = <<-EOS
      class { 'elasticsearch': }
    EOS
  end

  it 'my class should work with no errors' do
    # Run it once and make sure it doesn't bail with errors
    puppet_apply(pp) do |r|
      r.exit_code.should_not eq(1)
    end
  end

  it 'my class should be idempotent' do
    # Run it again and make sure no changes occurred this time, proving idempotency
    puppet_apply(pp) do |r|
      r.exit_code.should == 0
    end
  end
end
