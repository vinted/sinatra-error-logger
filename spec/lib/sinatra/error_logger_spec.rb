describe Sinatra::ErrorLogger do
  let(:app) { double('app', call: [200, {}, 'OK']) }
  let(:logger) { double('logger') }

  let(:request_method) { 'GET' }
  let(:request_uri) { '/uri' }
  let(:default_env) do
    {
      'REQUEST_METHOD' => request_method,
      'REQUEST_URI' => request_uri
    }
  end

  let(:exception) do
    StandardError.new.tap do |exception|
      exception.set_backtrace(caller)
    end
  end

  let(:instance) { Sinatra::ErrorLogger.new(app, logger) }

  describe '#log_error' do
    subject(:log_error) { instance.log_error(env) }

    context 'with exception' do
      let(:env) { default_env.merge('sinatra.error' => exception) }

      it 'logs error to logger' do
        expect(logger).to receive(:error).and_return(:result)
        log_error
      end
    end

    context 'without exception' do
      let(:env) { default_env }

      it 'does not log error to logger' do
        expect(logger).not_to receive(:error)
        log_error
      end
    end
  end

  describe '#format_message' do
    let(:env) { default_env.merge('sinatra.error' => exception) }

    subject(:message) { instance.format_message(exception, env) }

    it 'includes request method' do
      expect(message).to include(request_method)
    end

    it 'includes request uri' do
      expect(message).to include(request_uri)
    end

    it 'includes exception message' do
      expect(message).to include('StandardError')
    end

    it 'includes backtrace' do
      expect(message).to include('sinatra/error_logger_spec.rb')
    end
  end

  describe '#call' do
    subject(:call) { instance.call(default_env) }

    it 'calls log error' do
      expect(instance).to receive(:log_error).with(default_env)
      call
    end

    it 'returns app result' do
      expect(call).to eq [200, {}, 'OK']
    end
  end
end
