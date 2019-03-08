package link.zhidou.translator.ui.fragment;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ListView;


import java.util.ArrayList;

import link.zhidou.translator.Config;
import link.zhidou.translator.R;
import link.zhidou.translator.adapter.SettingListAdapter;
import link.zhidou.translator.model.bean.SettingBean;
import link.zhidou.translator.ui.activity.BluetoothSettingsActivity;
import link.zhidou.translator.ui.activity.DateTimeSettings;
import link.zhidou.translator.ui.activity.DisplaySettingsActivity;
import link.zhidou.translator.ui.activity.SettingModeActivity;
import link.zhidou.translator.ui.activity.StorageSettingsActivity;
import link.zhidou.translator.ui.view.CommonActionBar;
import link.zhidou.translator.utils.SPKeyContent;
import link.zhidou.translator.utils.SPUtil;

import static link.zhidou.translator.Config.CODE_SET_SEX;

public class MoreSettingsFragment extends BaseFragment implements CommonActionBar.BackPressedListener {

    private String mDisplaySettings;
    private String mMode;
    private String mDateTime;
    private String mStorage;
    private SettingListAdapter mAdapter;
    private SettingBean mSettingBean;
    private String mBluetoothTitle;
    private SettingBean mBluetoothSettingBean;

    private ListView mLvSetting;
    private CommonActionBar mActionBar;
    private ArrayList<SettingBean> mListSetting;


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // TODO Auto-generated method stub
        View view = inflater.inflate(R.layout.settings_more, container, false);
        mActionBar = view.findViewById(R.id.common_action_bar);
        mActionBar.setBackPressedListener(this);
        mActionBar.setTitle(getActivity().getResources().getString(R.string.more_settings));
        initView2(view);
        return view;
    }


    private void initView2(View view) {

        initSettingData();

        mLvSetting = (ListView) view.findViewById(R.id.lv_setting);
        mAdapter = new SettingListAdapter(getContext(), mListSetting);
        mLvSetting.setAdapter(mAdapter);
        mLvSetting.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                mSettingBean = mListSetting.get(i);
                if (mSettingBean.isEnable()) {
                    handClick(mSettingBean);
                } else {
                    // Do nothing
                }
            }
        });
    }



    public void initSettingData() {
        mListSetting = new ArrayList<>();

        mMode = getContext().getResources().getString(R.string.mode);
        SettingBean settingBeanmode = new SettingBean(R.mipmap.mode, mMode, "", true);
        String spMode = (String) SPUtil.get(getActivity().getBaseContext(), SPKeyContent.SETTING_MODE, Config.Mode.DEFAULT);
        settingBeanmode.setUserChoice(Config.labelFromValue(getContext(), R.array.mode_entries, R.array.mode_values, spMode));
        mListSetting.add(settingBeanmode);

        mBluetoothTitle = getContext().getResources().getString(R.string.activity_bluetooth_title);
        mBluetoothSettingBean = new SettingBean(R.mipmap.bluetooth, mBluetoothTitle, "", true);
        mListSetting.add(mBluetoothSettingBean);


         mDisplaySettings = getContext().getResources().getString(R.string.display_settings);
         SettingBean displaySettings = new SettingBean(R.mipmap.display, mDisplaySettings, "", true);
         mListSetting.add(displaySettings);

         mDateTime = getContext().getResources().getString(R.string.date_and_time);
         SettingBean settingBeanDateTime = new SettingBean(R.mipmap.time, mDateTime, "", true);
         mListSetting.add(settingBeanDateTime);

         //Storage
         mStorage = getContext().getResources().getString(R.string.storage_settings);
         SettingBean storage = new SettingBean(R.mipmap.storage, mStorage, "", true);
         mListSetting.add(storage);

    }


    private void handClick(SettingBean settingBean) {
        if (settingBean == null) {
            return;
        }

        if (settingBean.getSettingName().equals(mBluetoothTitle)) {
            startActivity(new Intent(getContext(), BluetoothSettingsActivity.class));
            return; //TODO: 黄鹏，你们写的为啥没有return
        }


        if (settingBean.getSettingName().equals(mDisplaySettings)) {
            Intent intent = new Intent(getContext(), DisplaySettingsActivity.class);
            startActivity(intent);
        }

        if (settingBean.getSettingName().equals(mMode)) {
            Intent intentLeft = new Intent(getContext(), SettingModeActivity.class);
            MoreSettingsFragment.this.startActivityForResult(intentLeft, CODE_SET_SEX);
        }


        if (settingBean.getSettingName().equals(mDateTime)) {
            Intent intentLeft = new Intent(getContext(), DateTimeSettings.class);
            startActivity(intentLeft);
        }


        if (settingBean.getSettingName().equals(mStorage)) {
            Intent intentLeft = new Intent(getContext(), StorageSettingsActivity.class);
            MoreSettingsFragment.this.startActivity(intentLeft);
            return;
        }


    }



    @Override
    public void onBackPressed(View view) {
        final Activity activity = getActivity();
        if (activity != null) {
            activity.onBackPressed();
        }
    }


}
