describe Travis::Yml::Schema::Def::Notification::Hipchat, 'structure' do
  subject { Travis::Yml.schema[:definitions][:notification][:hipchat] }

  # it { puts JSON.pretty_generate(subject) }

  it do
    should include(
      '$id': :hipchat,
      title: 'Hipchat',
      normal: true,
      see: kind_of(Hash),
      anyOf: [
        {
          type: :object,
          properties: {
            rooms: {
              '$ref': '#/definitions/type/secures',
              summary: kind_of(String)
            },
            format: {
              type: :string,
              enum: [
                'html',
                'text'
              ],
              summary: kind_of(String)
            },
            notify: {
              type: :boolean,
              summary: kind_of(String)
            },
            if: {
              '$ref': '#/definitions/type/condition'
            },
            on_pull_requests: {
              type: :boolean,
              summary: kind_of(String)
            },
            template: {
              '$ref': '#/definitions/notification/templates'
            },
            on_success: {
              '$ref': '#/definitions/notification/frequency'
            },
            on_failure: {
              '$ref': '#/definitions/notification/frequency'
            },
            enabled: {
              type: :boolean,
              summary: kind_of(String)
            },
            disabled: {
              type: :boolean,
              summary: kind_of(String)
            }
          },
          additionalProperties: false,
          normal: true,
          prefix: {
            key: :rooms
          },
          changes: [
            {
              change: :enable,
            }
          ]
        },
        {
          '$ref': '#/definitions/type/secures'
        },
        {
          type: :boolean
        }
      ]
    )
  end
end
