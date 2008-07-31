/*--
 * This file is one part of:
 *   Rubygame -- Ruby bindings to SDL to facilitate game creation
 *
 * Copyright (C) 2008  John Croisant
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *++
 */


#include "rubygame_shared.h"

void Rubygame_Init_Event2();

VALUE mEvents;




/* 
 * Make a new event from the given klassname and array of arguments.
 *
 */
VALUE rg_make_rbevent( char *klassname, int argc, VALUE *argv )
{
  VALUE klass = rb_const_get( mEvents, rb_intern(klassname) );
  return rb_funcall2( klass, rb_intern("new"), argc, argv );
}



/*
 * Convert SDL's ACTIVEEVENT into one of:
 *
 *   InputFocusGained / InputFocusLost
 *   MouseFocusGained / MouseFocusLost
 *   WindowMinimized  / WindowUnMinimized
 *
 * Which class we use depends on the details of the ACTIVEEVENT.
 *
 */
VALUE rg_convert_activeevent( SDL_Event ev )
{
  char *klassname;

  switch( ev.active.state )
  {
    case SDL_APPINPUTFOCUS:
      klassname = ev.active.gain ? "InputFocusGained" : "InputFocusLost";
      break;

    case SDL_APPMOUSEFOCUS:
      klassname = ev.active.gain ? "MouseFocusGained" : "MouseFocusLost";
      break;

    case SDL_APPACTIVE:
      klassname = ev.active.gain ? "WindowUnminimized" : "WindowMinimized";
      break;

    default:
      rb_raise(eSDLError, 
               "unknown ACTIVEEVENT state %d. This is a bug in Rubygame.",
               ev.active.state);
  }

  return rg_make_rbevent( klassname, 0, (VALUE *)NULL );
}




void Rubygame_Init_Event2()
{
#if 0
  mRubygame = rb_define_module("Rubygame");
#endif

  mEvents = rb_define_module_under( mRubygame, "Events" );

}
