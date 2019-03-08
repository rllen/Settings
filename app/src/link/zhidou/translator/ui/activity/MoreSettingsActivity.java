package link.zhidou.translator.ui.activity;

import android.os.Bundle;
import android.support.annotation.Nullable;

import link.zhidou.translator.R;
import link.zhidou.translator.ui.activity.base.BaseActivity;


public class MoreSettingsActivity extends BaseActivity {

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.more_settings_host);
    }

}
