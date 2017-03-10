@Records = React.createClass
  getInitialState: ->
    records: @props.records
  getDefaultProps: ->
    records: []
  render: ->
    React.DOM.div
      className: 'records'
      React.DOM.h2
        className: 'title'
        'Expenses'
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null
          React.DOM.tr null
            React.DOM.th null, 'Title'
            React.DOM.th null, 'Date'
            React.DOM.th null, 'Amount'
        React.DOM.tr null
          for record in @state.records
            React.createElement Record, key: record.id, record: record