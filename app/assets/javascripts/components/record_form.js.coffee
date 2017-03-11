@RecordForm = React.createClass
  getInitialState: ->
    title: ''
    date: ''
    amount: ''
  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
  valid: ->
    @state.date && @state.title && @state.amount
  handleSubmit: (e) ->
    e.preventDefault()
    $.post '', {record: @state}, (data) =>
      @props.handleNewRecord data
      @setState @getInitialState()
    , 'JSON'

  render: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          placeholder: 'Expense Statement'
          name: 'title'
          value: @state.title
          className: 'form-control'
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          placeholder: 'Date of Expenditure'
          name: 'date'
          value: @state.date
          className: 'form-control'
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          className: 'form-control'
          type: 'number'
          placeholder: 'Amount of expense'
          value: @state.amount
          onChange: @handleChange
          name: 'amount'
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid()
        'Create record'