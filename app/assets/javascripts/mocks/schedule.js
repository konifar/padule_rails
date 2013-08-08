$.mockjax({
    url: "/schedules?event_id=1",
    responseText: [
        {
            "id": 1,
            "event_id": 1,
            "start_time": "2013-07-01 10:00:00",
            "end_time": "2013-07-01 10:30:00",
            "seeker_schedules": [
                {
                    "id": 1,
                    "type": 1,
                    "seeker": {
                        "id": 1,
                        "event_id": 1,
                        "name": "森 慶太",
                        "mail": "keita_m@gmail.com",
                        "comment": "よろしくお願いします。"
                    }
                },
                {
                    "id": 2,
                    "type": 0,
                    "seeker": {
                        "id": 2,
                        "event_id": 1,
                        "name": "ダンバ ムンフ",
                        "mail": "damba_m@gmail.com",
                        "comment": "よろしくお願いします。"
                    }
                },
                {
                    "id": 3,
                    "type": 0,
                    "seeker": {
                        "id": 3,
                        "event_id": 1,
                        "name": "佐々木 浩史",
                        "mail": "kouji_s@gmail.com",
                        "comment": "よろしくお願いします。"
                    }
                }
            ]
        },
        {
            "id": 2,
            "event_id": 1,
            "start_time": "2013-07-02 16:00:00",
            "end_time": "2013-07-02 16:30:00",
            "seeker_schedules": [
                {
                    "id": 4,
                    "type": 1,
                    "seeker": {
                        "id": 1,
                        "event_id": 1,
                        "name": "森 慶太",
                        "mail": "keita_m@gmail.com",
                        "comment": "よろしくお願いします。"
                    }
                },
                {
                    "id": 5,
                    "type": 2,
                    "seeker": {
                        "id": 2,
                        "event_id": 1,
                        "name": "ダンバ ムンフ",
                        "mail": "damba_m@gmail.com",
                        "comment": "よろしくお願いします。"
                    }
                },
                {
                    "id": 6,
                    "type": 1,
                    "seeker": {
                        "id": 3,
                        "event_id": 1,
                        "name": "佐々木 浩史",
                        "mail": "kouji_s@gmail.com",
                        "comment": "よろしくお願いします。"
                    }
                }
            ]
        },
        {
            "id": 3,
            "event_id": 1,
            "start_time": "2013-07-03 12:00:00",
            "end_time": "2013-07-03 12:30:00",
            "seeker_schedules": [
                {
                    "id": 7,
                    "type": 0,
                    "seeker": {
                        "id": 1,
                        "event_id": 1,
                        "name": "森 慶太",
                        "mail": "keita_m@gmail.com",
                        "comment": "よろしくお願いします。"
                    }
                },
                {
                    "id": 8,
                    "type": 1,
                    "seeker": {
                        "id": 2,
                        "event_id": 1,
                        "name": "ダンバ ムンフ",
                        "mail": "damba_m@gmail.com",
                        "comment": "よろしくお願いします。"
                    }
                },
                {
                    "id": 9,
                    "type": 1,
                    "seeker": {
                        "id": 3,
                        "event_id": 1,
                        "name": "佐々木 浩史",
                        "mail": "kouji_s@gmail.com",
                        "comment": "よろしくお願いします。"
                    }
                }
            ]
        }
    ]
});

$.mockjax({
    url: "/schedules?event_id=2",
    responseText: [
        {

        }
    ]
});

$.mockjax({
    url: "/schedules?event_id=3",
    responseText: [
        {

        }
    ]
});

$.mockjax({
    url: "/schedules?event_id=4",
    responseText: [
        {

        }
    ]
});

$.mockjax({
    url: "/schedules?event_id=5",
    responseText: [
        {

        }
    ]
});