# Encoding: utf-8
require_relative 'spec_helper'

describe 'logstash::server' do
  describe 'ubuntu' do
    let(:runner) { ChefSpec::Runner.new(::UBUNTU_OPTS) }
    let(:node) { runner.node }
    let(:chef_run) do
      # runner.node.set['logstash'] ...
      runner.converge(described_recipe)
    end
    include_context 'stubs-common'

    it 'calls the logstash_instance LWPR' do
      expect(chef_run).to create_logstash_instance('server')
    end

    it 'calls the logstash_config LWPR' do
      expect(chef_run).to create_logstash_config('server')
    end

    it 'calls the logstash_pattern LWPR' do
      expect(chef_run).to create_logstash_pattern('server')
    end

    it 'calls the logstash_instance LWPR' do
      expect(chef_run).to enable_logstash_service('server')
      expect(chef_run).to start_logstash_service('server')
    end

  end
end
