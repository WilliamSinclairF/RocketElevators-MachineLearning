const form = document.getElementById('new_intervention');
// inputs with event listeners
const customerInput = document.getElementById('intervention_customer_id');
const buildingInput = document.getElementById('intervention_building_id');
const batteryInput = document.getElementById('intervention_battery_id');
const columnInput = document.getElementById('intervention_column_id');
const elevatorInput = document.getElementById('intervention_elevator_id');

$(customerInput).change(e => {
  $('#building-section').show();
  $('#battery-section').hide();
  $('#employee-section').hide();
  $('#status-section').hide();
  $('#result-section').hide();
  $('#report-section').hide();
  $('#column-section').hide();
  $('#elevator-section').hide();

  $.ajax({
    url: '/buildings',
    method: 'GET',
    data: { id: e.target.value },
    success: data => {
      $(buildingInput).empty();
      buildingInput.append(new Option('None', ''));
      data.map(e => {
        console.log(e);
        let street = e.address.number_and_street;
        let city = e.address.city;
        let state = e.address.state;
        let zip = e.address.postal_code;
        buildingInput.append(
          new Option(`${street} ${city} ${state} ${zip}`, e.id)
        );
      });
    },
  });
});

$(buildingInput).change(e => {
  $('#battery-section').show();
  $('#employee-section').show();
  $('#status-section').show();
  $('#result-section').show();
  $('#report-section').show();
  $.ajax({
    url: '/batteries',
    method: 'GET',
    data: { id: e.target.value },
    success: data => {
      $(batteryInput).empty();
      batteryInput.append(new Option('None', ''));
      data.map(e => {
        console.log(e);
        batteryInput.append(new Option('Battery ' + e.id, e.id));
      });
    },
  });
});

$(batteryInput).change(e => {
  $('#column-section').show();
  $.ajax({
    url: '/columns',
    method: 'GET',
    data: { id: e.target.value },
    success: data => {
      $(columnInput).empty();
      columnInput.append(new Option('None', ''));
      data.map(e => {
        columnInput.append(new Option('Column ' + e.id, e.id));
      });
    },
  });
});

$(columnInput).change(e => {
  $('#elevator-section').show();
  $.ajax({
    url: '/elevators',
    method: 'GET',
    data: { id: e.target.value },
    success: data => {
      $(elevatorInput).empty();
      elevatorInput.append(new Option('None', ''));
      data.map(e => {
        elevatorInput.append(
          new Option(`Elevator ID ${e.id} - SN: ${e.serial_number}`, e.id)
        );
      });
    },
  });
});
