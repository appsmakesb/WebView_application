package com.updatefcm.webtoapp;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.recyclerview.widget.RecyclerView;

import java.util.List;

public class DrawerAdapter extends RecyclerView.Adapter<RecyclerView.ViewHolder> {

    private final int VIEW_TYPE_HEADER = 0;
    private final int VIEW_TYPE_ITEM = 1;

    private final Context mContext;
    private final List<DrawerItem> mDrawerItems;
    private final DrawerItemClickedListener mListener;
    private View mHeaderView;

    public interface DrawerItemClickedListener {
        void onItemClicked(DrawerItem drawerItem);
    }

    public DrawerAdapter(Context context, List<DrawerItem> drawerItems, DrawerItemClickedListener listener) {
        mContext = context;
        mDrawerItems = drawerItems;
        mListener = listener;
    }

    @Override
    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        if (viewType == VIEW_TYPE_HEADER) {
            return new HeaderViewHolder(mHeaderView);
        } else {
            View view = LayoutInflater.from(mContext).inflate(R.layout.drawer_item, parent, false);
            return new ItemViewHolder(view);
        }
    }

    @Override
    public void onBindViewHolder(RecyclerView.ViewHolder holder, int position) {
        if (holder instanceof HeaderViewHolder) {
            // Do nothing, header view has already been inflated
        } else {
            DrawerItem drawerItem = mDrawerItems.get(position - 1);
            ((ItemViewHolder) holder).bind(drawerItem);
        }
    }

    @Override
    public int getItemCount() {
        return mDrawerItems.size() + 1; // Add 1 for the header view
    }

    @Override
    public int getItemViewType(int position) {
        if (position == 0) {
            return VIEW_TYPE_HEADER;
        } else {
            return VIEW_TYPE_ITEM;
        }
    }

    public void addHeaderView(View headerView) {
        mHeaderView = headerView;
    }

    class HeaderViewHolder extends RecyclerView.ViewHolder {
        public HeaderViewHolder(View itemView) {
            super(itemView);
        }
    }

    class ItemViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener {

        private final TextView mTitleTextView;
        private final ImageView mIconImageView;

        public ItemViewHolder(View itemView) {
            super(itemView);
            itemView.setOnClickListener(this);
            mTitleTextView = itemView.findViewById(R.id.item_text);
            mIconImageView = itemView.findViewById(R.id.item_icon);
        }

        public void bind(DrawerItem drawerItem) {
            mTitleTextView.setText(drawerItem.getName());
            mIconImageView.setImageResource(drawerItem.getIcon());
        }

        @Override
        public void onClick(View view) {
            int position = getAdapterPosition() - 1; // Subtract 1 to account for the header view
            DrawerItem drawerItem = mDrawerItems.get(position);
            mListener.onItemClicked(drawerItem);
        }
    }
}



