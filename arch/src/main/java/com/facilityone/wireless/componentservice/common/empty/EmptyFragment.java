package com.facilityone.wireless.componentservice.common.empty;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.view.View;
import android.widget.Button;

import com.facilityone.wireless.a.arch.R;
import com.facilityone.wireless.a.arch.ec.module.FunctionService;
import com.facilityone.wireless.a.arch.ec.module.IService;
import com.facilityone.wireless.a.arch.mvp.BaseFragment;
import com.facilityone.wireless.componentservice.common.permissions.PermissionsManager;
import com.luojilab.component.componentlib.router.ui.UIRouter;

import java.util.List;

/**
 * Author：gary
 * Email: xuhaozv@163.com
 * description:其他组件单独使用的时候的初始化(登录等)
 * Date: 2018/10/15 5:23 PM
 */
public class EmptyFragment extends BaseFragment<EmptyPresenter> {

    private Button mBtn;

    private static final String MENU_TYPE = "menu_type";
    private int mType = -1;

    @Override
    public EmptyPresenter createPresenter() {
        return new EmptyPresenter(mType);
    }

    @Override
    public Object setLayout() {
        return R.layout.fragment_empty;
    }

    @Override
    public void onViewCreated(View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        Bundle arguments = getArguments();
        if (arguments != null) {
            mType = arguments.getInt(MENU_TYPE, -1);
        }
        mBtn = findViewById(R.id.btn);

        //TODO xcq
//        showLoading();
//        getPresenter().logon("wangan", "111111");

        Bundle bundle = new Bundle();
        bundle.putBoolean(IService.COMPONENT_RUNALONE, true);
        //if (bean.sortChildMenu != null) {
        //     bundle.putSerializable(IService.FRAGMENT_CHILD_KEY, bean.sortChildMenu);

        //}

        goFragment(bundle);

        showLogonButton();
        mBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //TODO xcq
//                Bundle bundle = new Bundle();
//                UIRouter.getInstance().openUri(getActivity(), "DDComp://maintenance/maintenanceHome", bundle);
                //showLoading();
                //getPresenter().logon("wangan", "111111");


                //TODO xcq
                List<FunctionService.FunctionBean> list = PermissionsManager.HomeFunction.getInstance().show(null);
                //for (FunctionService.FunctionBean bean : list) {
                    //if (bean.type == type) {
                    Bundle bundle = new Bundle();
                    bundle.putBoolean(IService.COMPONENT_RUNALONE, true);
                    //if (bean.sortChildMenu != null) {
                   //     bundle.putSerializable(IService.FRAGMENT_CHILD_KEY, bean.sortChildMenu);

                    //}

                    goFragment(bundle);
                    //}
                //}

            }
        });
    }

    public void goFragment(Bundle bundle) {
        if (mOnGoFragmentListener != null) {
            mOnGoFragmentListener.goFragment(bundle);
        }
    }

    public void showLogonButton() {
        mBtn.setVisibility(View.VISIBLE);
    }

    public void setOnGoFragmentListener(OnGoFragmentListener onGoFragmentListener) {
        mOnGoFragmentListener = onGoFragmentListener;
    }

    private OnGoFragmentListener mOnGoFragmentListener;

    public interface OnGoFragmentListener {
        void goFragment(Bundle bundle);
    }

    public static EmptyFragment getInstance(int type) {
        Bundle bundle = new Bundle();
        bundle.putInt(MENU_TYPE, type);
        EmptyFragment fragment = new EmptyFragment();
        fragment.setArguments(bundle);
        return fragment;
    }

}
