$(document).ready(() => {
    function initialize() {
        eventHandler();
    }

    function eventHandler() {
        $(document).on('click', '.searchAddress', function (event) {
            callPostCodeAPI($(this), event);
        });
    }

    function callPostCodeAPI(target, event) {
        let targetParent = target.closest('.customerAddress'); // 부모 요소를 지정
        let addressPostcode = targetParent.find('.addressPostcode');
        let addressRoad = targetParent.find('.addressRoad');
        let addressBname = targetParent.find('.addressBname');

        new daum.Postcode({
            oncomplete: function (data) {
                let roadAddr = data.roadAddress;
                let extraRoadAddr = '';

                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraRoadAddr += data.bname;
                }
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if (extraRoadAddr !== '') {
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                addressPostcode.val(data.zonecode);
                addressRoad.val(roadAddr);

                if (roadAddr !== '') {
                    addressBname.val(extraRoadAddr);
                } else {
                    addressBname.val('');
                }
            }
        }).open();
    }

    initialize();
});
