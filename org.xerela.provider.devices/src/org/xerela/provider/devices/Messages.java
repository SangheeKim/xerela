/*
 * The contents of this file are subject to the Mozilla Public License
 * Version 1.1 (the "License"); you may not use this file except in
 * compliance with the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/
 * 
 * Software distributed under the License is distributed on an "AS IS"
 * basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
 * License for the specific language governing rights and limitations
 * under the License.
 * 
 * The Original Code is Ziptie Client Framework.
 * 
 * The Initial Developer of the Original Code is AlterPoint.
 * Portions created by AlterPoint are Copyright (C) 2006,
 * AlterPoint, Inc. All Rights Reserved.
 * 
 * Contributor(s):
 */

package org.xerela.provider.devices;

import org.eclipse.osgi.util.NLS;

/**
 * Messages
 */
public final class Messages extends NLS
{
    public static String createdDevice;
    public static String DeviceProvider_addedBatchDevices;
    public static String DeviceProvider_invalidAdapterId;
    public static String DeviceProviderDelegate_deviceProviderUnavailable;
    public static String DeviceTagProviderDelegate_tagProviderUnavailable;
    public static String exceptionDuringRollback;
    public static String exceptionDuringTransaction;
    public static String SimpleDeviceSearch_adapterServiceUnavailable;
    public static String SimpleDeviceSearchDelegate_searchProviderUnavailable;
    public static String IpResolutionScheme_invalidAddress;
    private static final String BUNDLE_NAME = "org.xerela.provider.devices.messages"; //$NON-NLS-1$

    static
    {
        // initialize resource bundle
        NLS.initializeMessages(BUNDLE_NAME, Messages.class);
    }

    private Messages()
    {
    }
}
