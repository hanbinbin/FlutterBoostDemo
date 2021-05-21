package com.example.flutter;

import android.graphics.drawable.AnimationDrawable;
import android.os.Bundle;
import androidx.annotation.Nullable;
import com.idlefish.flutterboost.containers.FlutterBoostActivity;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public class FlutterContainerActivity extends FlutterBoostActivity {
    private final String uniqueId = UUID.randomUUID().toString();

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    private AnimationDrawable mAnimationDrawable;


    @Override
    public void finish() {
        if (mAnimationDrawable != null) {
            mAnimationDrawable.stop();
            mAnimationDrawable = null;
        }
        super.finish();
    }

    @Override
    public void onPostResume() {
        super.onPostResume();
    }


    @Override
    public String getUrl() {
        return "aiwaysautoapp://flutter/business/demoHome";
    }

    @Override
    public Map getUrlParams() {
        Map<String, Object> map = new HashMap<>();
        return map;
    }

    @Override
    public String getUniqueId() {
        return uniqueId;
    }
}
