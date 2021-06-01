package com.example.moduleroutemain;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.Button;

import com.facilityone.wireless.demand.DemandActivity;
import com.facilityone.wireless.maintenance.MaintenanceActivity;
import com.facilityone.wireless.patrol.PatrolActivity;
import com.facilityone.wireless.patrol.fragment.PatrolMenuFragment;
import com.facilityone.wireless.workorder.WorkOrderActivity;
import com.luojilab.component.componentlib.router.ui.UIRouter;

public class MainActivity extends AppCompatActivity {

    private Button button;
    private Button button2;
    private Button button3;
    private Button button4;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        initView();
        initListeners();
    }
    private String TAG="zhouyang";

    private void initListeners() {
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Log.d(TAG, "onClick: ");
//                Bundle bundle = new Bundle();
//                UIRouter.getInstance().openUri(MainActivity.this, "DDComp://maintenance/maintenanceHome", bundle);

                //PatrolMenuFragment.getInstance(new Bundle());
                Intent it = new Intent(MainActivity.this, PatrolActivity.class);
                startActivity(it);
            }
        });
        button2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
//                Bundle bundle = new Bundle();
//                UIRouter.getInstance().openUri(MainActivity.this, "DDComp://maintenance/maintenanceHome", bundle);
                Intent it = new Intent(MainActivity.this, MaintenanceActivity.class);
                startActivity(it);
            }
        });
        button3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
//                Bundle bundle = new Bundle();
//                UIRouter.getInstance().openUri(MainActivity.this, "DDComp://maintenance/maintenanceHome", bundle);

                Intent it = new Intent(MainActivity.this, WorkOrderActivity.class);
                startActivity(it);
            }
        });
        button4.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent it = new Intent(MainActivity.this, DemandActivity.class);
                startActivity(it);
//                Bundle bundle = new Bundle();
//                UIRouter.getInstance().openUri(MainActivity.this, "DDComp://maintenance/maintenanceHome", bundle);
            }
        });
    }

    private void initView() {
        button = (Button) findViewById(R.id.button);
        button2 = (Button) findViewById(R.id.button2);
        button3 = (Button) findViewById(R.id.button3);
        button4 = (Button) findViewById(R.id.button4);
    }
}
