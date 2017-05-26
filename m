Return-Path: joerg@higgsboson.tk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 16c63a81
 for <wireguard@lists.zx2c4.com>;
 Fri, 26 May 2017 20:56:39 +0000 (UTC)
Received: from mail.thalheim.io (mail.thalheim.io [188.68.39.17])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 45eb9bbd
 for <wireguard@lists.zx2c4.com>;
 Fri, 26 May 2017 20:56:39 +0000 (UTC)
Received: from [172.22.213.17] (global-184-110.nat-1.net.cam.ac.uk
 [131.111.184.110])
 by mail.thalheim.io (Postfix) with ESMTPSA id 238B26F756
 for <wireguard@lists.zx2c4.com>; Fri, 26 May 2017 21:09:11 +0000 (UTC)
Subject: Re: [PATCH] tools: add wireguard@.service
To: wireguard@lists.zx2c4.com
References: <20170526084423.31088-1-flokli@flokli.de>
 <87wp93octp.fsf@fifthhorseman.net>
From: =?UTF-8?Q?J=c3=b6rg_Thalheim?= <joerg@higgsboson.tk>
Message-ID: <e28694a9-53af-57ce-9b94-cf5f2d25b1e7@higgsboson.tk>
Date: Fri, 26 May 2017 22:09:10 +0100
MIME-Version: 1.0
In-Reply-To: <87wp93octp.fsf@fifthhorseman.net>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


On 2017-05-26 16:30, Daniel Kahn Gillmor wrote:
>> diff --git a/src/tools/wireguard@.service b/src/tools/wireguard@.service
>> new file mode 100644
>> index 0000000..b6d53bf
>> --- /dev/null
>> +++ b/src/tools/wireguard@.service
>> @@ -0,0 +1,19 @@
>> +[Unit]
>> +Description=WireGuard via wg(8) for %I
>> +After=network-online.target
>> +Wants=network-online.target

My guess is that network-online.target was chosen for wg-quick because DNS resolving of endpoints might be required.
For this target to become effective this requires either systemd-networkd or a recent version NetworkManager to be running
(or any other service, which makes its connection state a dependency of |network-online.target|).

Once wireguard becomes integrated into systemd-networkd, networkd will just retry forever to resolve endpoints with exponential back-off.
