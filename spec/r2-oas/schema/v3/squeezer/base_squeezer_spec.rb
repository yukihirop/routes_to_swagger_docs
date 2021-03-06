# frozen_string_literal: true

require 'spec_helper'
require 'r2-oas/schema/v3/squeezer/base_squeezer'

RSpec.describe R2OAS::Schema::V3::BaseSqueezer do
  let(:schema_data) { {} }
  let(:options) { {} }
  let(:sequeezer) { described_class.new(schema_data, options) }

  describe '#squeeze_docs' do
    before do
      allow_any_instance_of(described_class).to receive(:create_tag_names)
    end

    it { expect { sequeezer.squeeze_docs }.to raise_error(R2OAS::NoImplementError, 'Please implement in inherited class.') }
  end
end
