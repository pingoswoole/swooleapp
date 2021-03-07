
@extends('layouts.app')
@section('title', '隐私政策')
@section('header_style')
    <style>
        .page{
            padding: 10px;
        }
    </style>
@endsection
@section('body')

    <div class="page">
        {!! $content !!}
    </div>

@endsection