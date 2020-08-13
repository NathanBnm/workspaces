/*
 * Copyright (c) 2020 - Today Goncalo Margalho ()
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public
 * License along with this program; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301 USA
 *
 * Authored by: Goncalo Margalho <g@margalho.info>
 */

public class Workspaces.Widgets.SettingBox : Gtk.ListBoxRow {
    public Gtk.Widget widget { get; construct; }
    public string title { get; construct; }

    private Gtk.Grid grid;
    private Gtk.Label label;

    construct {
        activatable = false;
        selectable = false;

        label = new Gtk.Label (title);
        label.halign = Gtk.Align.START;
        label.margin = 6;

        grid = new Gtk.Grid ();
        grid.hexpand = true;
        grid.halign = Gtk.Align.END;
        grid.margin_end = 12;
        grid.margin_top = 8;
        grid.margin_bottom = 8;
        grid.add (widget);
    }

    public SettingBox (string title, Gtk.Widget widget, bool add_separator) {
        Object (title: title, widget: widget);

        var main_grid = new Gtk.Grid ();
        main_grid.column_spacing = 12;

        if (add_separator) {
            main_grid.attach (new Gtk.Separator (Gtk.Orientation.HORIZONTAL), 0, 0, 2, 1);
        }

        main_grid.attach (label, 0, 1, 1, 1);
        main_grid.attach (grid, 1, 1, 1, 1);
        add (main_grid);

        show_all ();
    }
}

public class Workspaces.Widgets.SettingsGrid : Gtk.Grid {
    private Gtk.ListBox list_box;
    private Gtk.Label title_label;

    construct {
        list_box = new Gtk.ListBox ();

        title_label = new Gtk.Label (null);
        title_label.get_style_context ().add_class ("h4");
        title_label.halign = Gtk.Align.START;

        var frame = new Gtk.Frame (null);
        frame.add (list_box);

        attach (title_label, 0, 0, 1, 1);
        attach (frame, 0, 1, 1, 1);
    }

    public SettingsGrid (string ? title) {
        Object ();
        if (title != null) {
            title_label.label = title;
        }
        //   else {
        //      set_widget_visible (title_label, false);
        //  }
    }

    public void add_widget (Gtk.Widget widget) {
        list_box.add (widget);
    }
}