package com.slkerndnme.cordova.bgcolor;

import org.apache.cordova.*;
import org.json.JSONArray;
import org.json.JSONException;

import android.app.Activity;
import android.content.Context;
import android.graphics.Color;

public class BackgroundColor extends CordovaPlugin {

    private static final String BACKGROUND_COLOR_RESOURCE_KEY = "custom_background_color";

    @Override
    public void initialize(CordovaInterface cordova, CordovaWebView webView) {

        Context context = cordova.getActivity();

        int backgroundColorResourceId = context.getResources().getIdentifier(BACKGROUND_COLOR_RESOURCE_KEY, "string", context.getPackageName());
        int backgroundColor = Color.parseColor(cordova.getActivity().getString(backgroundColorResourceId));

        webView.getView().setBackgroundColor(backgroundColor);
    }
}