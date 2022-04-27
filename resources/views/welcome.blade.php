<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Laravel</title>

    <!-- import CSS -->
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">

    <!-- Styles -->
    <link href="{{ mix('css/app.css', 'build') }}" rel="stylesheet">
    <style>
        .router-link-active {
            font-weight: bold;
            color: red;
        }
    </style>
</head>

<body class="antialiased">
    <div id="app">
        <app-component></app-component>
    </div>
    <script src="{{ mix('js/app.js', 'build') }}" async defer></script>
</body>
</html>
