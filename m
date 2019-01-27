Return-Path: <SRS0=+SnU=QD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2B95C282CA
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 27 Jan 2019 14:15:50 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 088622133F
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 27 Jan 2019 14:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 088622133F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=xand.uk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8cbf4585;
	Sun, 27 Jan 2019 14:09:57 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 460ee5d6
 for <wireguard@lists.zx2c4.com>;
 Sun, 27 Jan 2019 09:04:08 +0000 (UTC)
Received: from kronos.xand.uk (kronos.xand.uk [IPv6:2001:8b0:193:1::162])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4f174c7a
 for <wireguard@lists.zx2c4.com>;
 Sun, 27 Jan 2019 09:04:08 +0000 (UTC)
Received: from rainbow.xand.uk ([2001:8b0:193:1::171])
 by kronos.xand.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.91) (envelope-from <xand@xand.uk>) id 1gngRg-00038w-6v
 for wireguard@lists.zx2c4.com; Sun, 27 Jan 2019 09:09:40 +0000
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Xand <xand@xand.uk>
Subject: Issues with Android 9
Openpgp: preference=signencrypt
Autocrypt: addr=xand@xand.uk; prefer-encrypt=mutual; keydata=
 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
Message-ID: <b3d8835d-dd00-d4a0-6171-1b09730e8a94@xand.uk>
Date: Sun, 27 Jan 2019 09:09:31 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 27 Jan 2019 15:09:56 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7589511008003073509=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============7589511008003073509==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="vbot0j0xNHjlrzdKZnN5N4t5T06MMWNDf"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--vbot0j0xNHjlrzdKZnN5N4t5T06MMWNDf
Content-Type: multipart/mixed; boundary="YP6As8SAjOsS3XKyTqxUYMK2GNRkM9sKi";
 protected-headers="v1"
From: Xand <xand@xand.uk>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Message-ID: <b3d8835d-dd00-d4a0-6171-1b09730e8a94@xand.uk>
Subject: Issues with Android 9

--YP6As8SAjOsS3XKyTqxUYMK2GNRkM9sKi
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

I've been running the Android client on my OnePlus phone for a month or
so with no issues until upgrading to Android 9 (previously running 8.1).

Now, the WireGuard VPN will stop working after a few hours until I "turn
it off and on again". This is without roaming to another network - just
leaving the phone overnight for example. I've exported the log and note
there are a lot of "operation not permitted" errors, please see below.

Regards,
Xand

--------- beginning of events
01-26 22:07:39.674 11471 11471 I am_on_create_called:
[0,com.wireguard.android.activity.MainActivity,performCreate]
01-26 22:07:39.676 11471 11471 I am_on_start_called:
[0,com.wireguard.android.activity.MainActivity,handleStartActivity]
01-26 22:07:39.677 11471 11471 I am_on_resume_called:
[0,com.wireguard.android.activity.MainActivity,RESUME_ACTIVITY]
01-26 22:07:56.631 11471 11471 I am_on_paused_called:
[0,com.wireguard.android.activity.MainActivity,performPause]
01-26 22:07:56.647 11471 11471 I am_on_stop_called:
[0,com.wireguard.android.activity.MainActivity,STOP_ACTIVITY_ITEM]
01-26 23:14:58.321 11471 11471 I am_on_restart_called:
[0,com.wireguard.android.activity.MainActivity,performRestartActivity]
01-26 23:14:58.331 11471 11471 I am_on_start_called:
[0,com.wireguard.android.activity.MainActivity,handleStartActivity]
01-26 23:14:58.332 11471 11471 I am_on_resume_called:
[0,com.wireguard.android.activity.MainActivity,RESUME_ACTIVITY]
01-26 23:14:58.340 11471 11471 I am_on_paused_called:
[0,com.wireguard.android.activity.MainActivity,performPause]
01-26 23:14:58.340 11471 11471 I am_on_stop_called:
[0,com.wireguard.android.activity.MainActivity,handleRelaunchActivity]
01-26 23:14:58.342 11471 11471 I am_on_destroy_called:
[0,com.wireguard.android.activity.MainActivity,performDestroy]
01-26 23:14:58.383 11471 11471 I am_on_create_called:
[0,com.wireguard.android.activity.MainActivity,performCreate]
01-26 23:14:58.400 11471 11471 I am_on_start_called:
[0,com.wireguard.android.activity.MainActivity,handleStartActivity]
01-26 23:14:58.401 11471 11471 I am_on_resume_called:
[0,com.wireguard.android.activity.MainActivity,RESUME_ACTIVITY]
01-26 23:15:00.248 11471 11471 I am_on_paused_called:
[0,com.wireguard.android.activity.MainActivity,performPause]
01-26 23:15:00.269 11471 11471 I am_on_stop_called:
[0,com.wireguard.android.activity.MainActivity,STOP_ACTIVITY_ITEM]
01-26 23:15:07.639 11471 11471 I am_on_restart_called:
[0,com.wireguard.android.activity.MainActivity,performRestartActivity]
01-26 23:15:07.640 11471 11471 I am_on_start_called:
[0,com.wireguard.android.activity.MainActivity,handleStartActivity]
01-26 23:15:07.640 11471 11471 I am_on_resume_called:
[0,com.wireguard.android.activity.MainActivity,RESUME_ACTIVITY]
01-26 23:15:09.880 11471 11471 I am_on_paused_called:
[0,com.wireguard.android.activity.MainActivity,performPause]
01-26 23:15:09.895 11471 11471 I am_on_stop_called:
[0,com.wireguard.android.activity.MainActivity,STOP_ACTIVITY_ITEM]
--------- beginning of main
01-27 07:58:49.384 11471 25909 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 07:58:49.387 11471 25909 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 07:59:06.546 11471 25909 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 07:59:06.554 11471 25909 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:08:19.370 11471 25958 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:08:19.380 11471 25850 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:08:24.844 11471 25833 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE): Handshake did not complete after 5 s=
econds, retrying
(try 2)
01-27 08:08:24.844 11471 25833 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:08:24.848 11471 25833 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:11:05.826 11471 25958 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:11:05.830 11471 25958 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:11:11.035 11471 26840 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE): Handshake did not complete after 5 s=
econds, retrying
(try 2)
01-27 08:11:11.035 11471 26840 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:11:11.039 11471 26840 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:13:50.245 11471 25958 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:13:50.258 11471 25850 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:18:24.294 11471 25850 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:18:24.297 11471 25850 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:18:30.002 11471 25850 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:18:30.008 11471 26840 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE): Handshake did not complete after 5 s=
econds, retrying
(try 2)
01-27 08:18:30.011 11471 25850 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:21:33.548 11471 25850 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:21:33.567 11471 25909 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:21:38.751 11471 25833 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE): Handshake did not complete after 5 s=
econds, retrying
(try 2)
01-27 08:21:38.751 11471 25833 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:21:38.761 11471 25833 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:21:43.860 11471 25833 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE): Handshake did not complete after 5 s=
econds, retrying
(try 2)
01-27 08:21:43.861 11471 25833 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:21:43.868 11471 25833 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:21:48.976 11471 25833 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE): Handshake did not complete after 5 s=
econds, retrying
(try 2)
01-27 08:21:48.976 11471 25833 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:21:48.984 11471 25833 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:22:04.217 11471 26079 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:22:04.219 11471 26079 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:22:09.237 11471 26079 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:22:09.246 11471 25886 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Received handshake response
01-27 08:22:09.246 11471 25886 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Obtained awaited keypair
01-27 08:23:16.380 11471 11471 I am_on_destroy_called:
[0,com.wireguard.android.activity.MainActivity,performDestroy]
01-27 08:24:09.640 11471 25949 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:24:09.663 11471 28675 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Received handshake response
01-27 08:24:09.663 11471 28675 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending keepalive packet
01-27 08:26:09.745 11471 26035 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:26:09.764 11471 25957 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Received handshake response
01-27 08:26:09.764 11471 25957 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending keepalive packet
01-27 08:28:16.796 11471=C2=A0=C2=A0 582 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Receiving keepalive packet
01-27 08:28:17.100 11471 25835 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:28:17.106 11471=C2=A0=C2=A0 582 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Received handshake response
01-27 08:28:17.106 11471=C2=A0=C2=A0 582 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending keepalive packet
01-27 08:29:00.629 11471 25851 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Receiving keepalive packet
01-27 08:30:18.881 11471 26035 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Received handshake initiation
01-27 08:30:18.881 11471 26035 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake response
01-27 08:30:18.891 11471 25852 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Receiving keepalive packet
01-27 08:30:34.136 11471 25852 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Received handshake initiation
01-27 08:30:34.136 11471 25852 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake response
01-27 08:30:34.143 11471 25850 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Receiving keepalive packet
01-27 08:30:57.060 11471 25852 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:30:57.060 11471 25852 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:30:57.065 11471 25852 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:30:57.065 11471 25852 I chatty=C2=A0 :
uid=3D10139(com.wireguard.android) AsyncTask #2 identical 5 lines
01-27 08:30:57.065 11471 25852 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:30:57.072 11471 25850 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:31:12.426 11471 25907 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:31:22.128 11471 25886 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:31:22.984 11471 25828 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:31:23.053 11471 25828 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:31:23.127 11471 25852 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:31:28.310 11471 25852 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:31:28.382 11471 25852 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:31:38.546 11471 25852 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:31:49.175 11471 25886 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:31:52.449 11471 25852 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:31:53.309 11471 26079 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:31:53.805 11471 25886 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:31:55.450 11471 25886 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:31:57.531 11471 26079 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:31:59.043 11471 25886 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:31:59.333 11471 25886 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:32:00.514 11471 25852 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:32:04.040 11471 25886 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:32:04.316 11471 25886 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:32:05.686 11471 25886 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:32:14.701 11471 26079 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:32:15.907 11471 25852 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:32:20.104 11471 25886 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:32:21.012 11471=C2=A0=C2=A0 582 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:32:21.526 11471=C2=A0=C2=A0 582 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:32:22.163 11471 25836 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:32:22.173 11471 25836 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:32:22.591 11471=C2=A0=C2=A0 582 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:32:22.875 11471 25850 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:32:23.148 11471 25850 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:32:24.023 11471=C2=A0=C2=A0 582 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:32:24.535 11471=C2=A0=C2=A0 582 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:32:25.177 11471=C2=A0=C2=A0 582 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:32:25.599 11471 25886 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:32:25.879 11471 25850 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:32:26.156 11471 25886 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:32:27.031 11471 25886 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:32:30.281 11471 25886 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:32:31.816 11471 25886 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:32:32.842 11471=C2=A0=C2=A0 582 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:32:33.609 11471 25886 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:32:34.413 11471=C2=A0=C2=A0 582 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:32:35.319 11471 25886 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:32:36.185 11471=C2=A0=C2=A0 582 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:32:36.855 11471 25886 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:32:38.481 11471=C2=A0=C2=A0 582 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:32:39.277 11471 25886 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:32:39.557 11471 25886 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:32:42.198 11471=C2=A0=C2=A0 582 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:32:42.722 11471 25886 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:32:43.402 11471=C2=A0=C2=A0 582 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:32:44.422 11471 25886 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:32:45.043 11471 25886 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:32:45.362 11471=C2=A0=C2=A0 582 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:32:46.239 11471 25886 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:32:47.398 11471 25907 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:32:48.100 11471 25886 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:32:49.598 11471 25907 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:32:51.259 11471 25886 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:32:53.187 11471 25907 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:32:56.605 11471 25886 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:33:00.296 11471 25886 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:33:00.430 11471 25850 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:33:07.440 11471 25850 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:33:08.134 11471 25886 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:33:25.456 11471 25850 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:33:27.397 11471 25886 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:33:27.397 11471 25850 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:33:27.448 11471 25886 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:33:27.455 11471 25850 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:33:27.693 11471 25850 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:33:30.771 11471 25907 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:33:33.188 11471 25907 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:33:33.331 11471 25886 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:33:34.028 11471 25907 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:33:35.319 11471 25886 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:33:35.328 11471 25886 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:33:35.329 11471 25886 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Awaiting keypair
01-27 08:33:53.012 11471 25886 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE): Handshake did not complete after 5 s=
econds, retrying
(try 2)
01-27 08:33:53.013 11471 25886 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:33:53.022 11471 25886 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:34:04.159 11471=C2=A0=C2=A0 582 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:34:04.162 11471=C2=A0=C2=A0 582 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:34:09.175 11471=C2=A0=C2=A0 582 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:34:09.178 11471=C2=A0=C2=A0 582 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:34:19.964 11471=C2=A0=C2=A0 582 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:34:19.966 11471=C2=A0=C2=A0 582 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:34:35.348 11471=C2=A0=C2=A0 582 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:34:35.358 11471 25850 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:34:55.770 11471 25850 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:34:55.773 11471 25850 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:35:00.940 11471 25850 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:35:00.943 11471 25850 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:35:10.703 11471 25850 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:35:10.706 11471 25850 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:35:16.732 11471 25850 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:35:16.734 11471 25850 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:35:21.808 11471 25850 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:35:21.815 11471 25850 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:35:26.913 11471 25850 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:35:26.917 11471 25850 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:35:37.966 11471 25850 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:35:37.973 11471 25850 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:35:58.334 11471 25850 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:35:58.337 11471 25850 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:36:08.592 11471 25850 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:36:08.595 11471 25850 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:36:13.429 11471 25835 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Received handshake initiation
01-27 08:36:13.429 11471 25835 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake response
01-27 08:36:13.442 11471 25828 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Obtained awaited keypair
01-27 08:36:15.621 11471 25878 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:36:15.621 11471 25878 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:36:21.388 11471 25957 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:36:24.394 11471 25852 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:36:27.397 11471 26079 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:36:30.406 11471 26035 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:36:30.415 11471 25828 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE): Retrying handshake because we stoppe=
d hearing back
after 15 seconds
01-27 08:36:30.415 11471 25828 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:36:30.423 11471 25828 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:36:33.416 11471 25886 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:36:35.477 11471 25828 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE): Handshake did not complete after 5 s=
econds, retrying
(try 2)
01-27 08:36:35.477 11471 25828 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:36:35.495 11471 26035 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:36:36.423 11471 25907 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:36:39.431 11471 25907 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:36:40.797 11471 26035 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE): Handshake did not complete after 5 s=
econds, retrying
(try 3)
01-27 08:36:40.797 11471 26035 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:36:40.805 11471 26035 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:36:42.434 11471 26035 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:36:45.916 11471 25907 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE): Handshake did not complete after 5 s=
econds, retrying
(try 4)
01-27 08:36:45.916 11471 25907 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:36:45.926 11471 25907 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:36:48.028 11471 25907 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:36:51.037 11471 26035 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:36:51.070 11471 26035 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE): Handshake did not complete after 5 s=
econds, retrying
(try 5)
01-27 08:36:51.071 11471 26035 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:36:51.079 11471 26035 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:36:54.046 11471 25907 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:36:56.329 11471 26035 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE): Handshake did not complete after 5 s=
econds, retrying
(try 6)
01-27 08:36:56.329 11471 26035 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:36:56.335 11471 26035 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:36:57.050 11471 25907 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:37:00.061 11471 26079 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:37:01.397 11471 26035 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE): Handshake did not complete after 5 s=
econds, retrying
(try 7)
01-27 08:37:01.397 11471 26035 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:37:01.406 11471 26035 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:37:03.066 11471 26035 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:37:06.066 11471 26079 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:37:06.623 11471 26079 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE): Handshake did not complete after 5 s=
econds, retrying
(try 8)
01-27 08:37:06.623 11471 26079 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:37:06.631 11471 26079 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:37:09.069 11471 26079 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:37:09.378 11471 26079 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:37:11.849 11471 26079 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE): Handshake did not complete after 5 s=
econds, retrying
(try 9)
01-27 08:37:11.850 11471 26079 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:37:11.857 11471 26079 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:37:12.387 11471 26079 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:37:15.394 11471 26079 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:37:16.864 11471 25828 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE): Handshake did not complete after 5 s=
econds, retrying
(try 10)
01-27 08:37:16.864 11471 25828 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:37:16.873 11471 25828 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:37:18.401 11471 26079 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:37:21.408 11471 26035 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:37:21.886 11471 25828 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE): Handshake did not complete after 5 s=
econds, retrying
(try 11)
01-27 08:37:21.886 11471 25828 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:37:21.893 11471 25828 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:37:24.411 11471 25828 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:37:27.065 11471 26079 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE): Handshake did not complete after 5 s=
econds, retrying
(try 12)
01-27 08:37:27.066 11471 26079 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:37:27.074 11471 26079 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:37:27.415 11471 26035 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:37:30.423 11471 26035 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:37:32.160 11471 26079 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE): Handshake did not complete after 5 s=
econds, retrying
(try 13)
01-27 08:37:32.161 11471 26079 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:37:32.168 11471 26079 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:37:33.436 11471 25828 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:37:36.441 11471 25907 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:37:37.292 11471 26079 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE): Handshake did not complete after 5 s=
econds, retrying
(try 14)
01-27 08:37:37.292 11471 26079 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:37:37.301 11471 26079 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:37:39.450 11471 26035 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:37:42.369 11471 26079 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE): Handshake did not complete after 5 s=
econds, retrying
(try 15)
01-27 08:37:42.370 11471 26079 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:37:42.378 11471 26079 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:37:42.457 11471 26035 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:37:45.464 11471 26035 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:37:47.593 11471 26079 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE): Handshake did not complete after 5 s=
econds, retrying
(try 16)
01-27 08:37:47.593 11471 26079 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:37:47.604 11471 26079 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:37:48.471 11471 26035 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:37:51.475 11471 25907 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:37:52.927 11471 26079 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE): Handshake did not complete after 5 s=
econds, retrying
(try 17)
01-27 08:37:52.927 11471 26079 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:37:52.935 11471 26079 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:37:54.483 11471 26079 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:37:58.155 11471 25907 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE): Handshake did not complete after 5 s=
econds, retrying
(try 18)
01-27 08:37:58.155 11471 25907 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:37:58.163 11471 25907 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:38:03.189 11471 25907 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE): Handshake did not complete after 5 s=
econds, retrying
(try 19)
01-27 08:38:03.189 11471 25907 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:38:03.197 11471 25907 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:38:04.072 11471 26079 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:38:04.400 11471 26035 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:38:04.725 11471 26079 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:38:05.386 11471 26035 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:38:06.710 11471 26079 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:38:06.977 11471 26079 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:38:08.233 11471 25907 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE): Handshake did not complete after 5 s=
econds, retrying
(try 20)
01-27 08:38:08.233 11471 25907 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:38:08.241 11471 25907 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:38:09.355 11471 25907 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:38:09.983 11471 25907 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:38:12.990 11471 25907 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:38:13.410 11471 25907 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE): Handshake did not complete after 20 =
attempts, giving up
01-27 08:38:13.567 11471 26079 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:38:14.654 11471 25828 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:38:15.997 11471 26079 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:38:16.575 11471 25828 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:38:19.004 11471 25886 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:38:19.582 11471 25828 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:38:22.009 11471 25907 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:38:22.589 11471 25828 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:38:25.017 11471 25828 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:38:25.240 11471 25828 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:38:25.594 11471 26079 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:38:28.021 11471 25828 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:38:28.600 11471 26079 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:38:31.608 11471 25828 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:38:33.099 11471 26079 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:38:34.611 11471 25828 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:38:46.404 11471 25907 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:38:49.880 11471 26079 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:38:49.881 11471 26079 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:38:49.915 11471 25835 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:38:50.139 11471 25835 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:38:50.576 11471 25835 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:38:51.460 11471 25957 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:39:04.106 11471 25957 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:39:04.114 11471 26079 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:39:07.121 11471 26079 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:39:10.130 11471 25957 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:39:13.133 11471 25957 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send data packet write ud=
p4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:39:16.140 11471 25957 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:39:16.148 11471 25957 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:39:16.148 11471 25957 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Awaiting keypair
01-27 08:39:25.992 11471 25957 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE): Handshake did not complete after 5 s=
econds, retrying
(try 2)
01-27 08:39:25.992 11471 25957 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:39:25.996 11471 25957 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:39:31.137 11471 26079 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE): Handshake did not complete after 5 s=
econds, retrying
(try 2)
01-27 08:39:31.138 11471 26079 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:39:31.145 11471 26079 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:39:36.413 11471 25886 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:39:36.421 11471 25886 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:39:41.524 11471 25886 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:39:41.528 11471 25886 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:40:12.504 11471 25886 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:40:12.507 11471 25886 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:40:33.104 11471 25886 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:40:33.107 11471 25886 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:41:03.814 11471 25886 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:41:03.817 11471 25886 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:41:24.708 11471 25886 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:41:24.710 11471 25886 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:41:55.259 11471 25886 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:41:55.262 11471 25886 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:42:00.499 11471 25957 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE): Handshake did not complete after 5 s=
econds, retrying
(try 2)
01-27 08:42:00.499 11471 25957 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:42:00.502 11471 25957 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:42:36.457 11471 25957 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE): Handshake did not complete after 5 s=
econds, retrying
(try 2)
01-27 08:42:36.457 11471 25957 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:42:36.460 11471 25957 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:43:31.293 11471 25886 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:43:31.296 11471 25886 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:43:36.338 11471 25886 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:43:36.346 11471 25886 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:43:41.472 11471 25957 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE): Handshake did not complete after 5 s=
econds, retrying
(try 2)
01-27 08:43:41.472 11471 25957 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:43:41.479 11471 25957 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:43:46.629 11471 25886 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:43:46.637 11471 25886 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:43:51.834 11471 25828 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE): Handshake did not complete after 5 s=
econds, retrying
(try 2)
01-27 08:43:51.834 11471 25828 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:43:51.838 11471 25828 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:43:56.889 11471 25828 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE): Handshake did not complete after 5 s=
econds, retrying
(try 2)
01-27 08:43:56.889 11471 25828 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:43:56.897 11471 25828 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:44:02.097 11471 25828 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE): Handshake did not complete after 5 s=
econds, retrying
(try 2)
01-27 08:44:02.098 11471 25828 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:44:02.106 11471 25828 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:44:07.377 11471 25828 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE): Handshake did not complete after 5 s=
econds, retrying
(try 2)
01-27 08:44:07.377 11471 25828 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:44:07.385 11471 25828 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:44:12.409 11471 25828 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE): Handshake did not complete after 5 s=
econds, retrying
(try 2)
01-27 08:44:12.409 11471 25828 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:44:12.417 11471 25828 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:44:17.588 11471 25828 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE): Handshake did not complete after 5 s=
econds, retrying
(try 2)
01-27 08:44:17.589 11471 25828 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:44:17.590 11471 25828 E WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Failed to send handshake initiation=
 write udp4
0.0.0.0:40328->[server address redacted]:51820: sendto: operation not
permitted
01-27 08:44:19.838 11471 11471 W ActivityThread: handleWindowVisibility:
no activity for token android.os.BinderProxy@c65c005
01-27 08:44:19.873 11471 11471 I am_on_create_called:
[0,com.wireguard.android.activity.MainActivity,performCreate]
01-27 08:44:19.874 11471 11471 I am_on_start_called:
[0,com.wireguard.android.activity.MainActivity,handleStartActivity]
01-27 08:44:19.875 11471 11471 I am_on_resume_called:
[0,com.wireguard.android.activity.MainActivity,RESUME_ACTIVITY]
01-27 08:44:19.898 11471 29166 D DecorView:
onWindowFocusChangedFromViewRoot hasFocus: true,
DecorView@4f9eb36[MainActivity]
01-27 08:44:22.687 11471 25886 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:44:22.723 11471 28675 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Received handshake response
01-27 08:44:22.723 11471 28675 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Obtained awaited keypair
01-27 08:44:23.804 11471 11471 W StaticLayout: maxLineHeight should not
be -1.=C2=A0 maxLines:1 lineCount:1
01-27 08:44:23.805 11471 11471 I chatty=C2=A0 :
uid=3D10139(com.wireguard.android) identical 2 lines
01-27 08:44:23.805 11471 11471 W StaticLayout: maxLineHeight should not
be -1.=C2=A0 maxLines:1 lineCount:1
01-27 08:44:29.910 11471 11471 W StaticLayout: maxLineHeight should not
be -1.=C2=A0 maxLines:1 lineCount:1
01-27 08:44:29.911 11471 11471 I chatty=C2=A0 :
uid=3D10139(com.wireguard.android) identical 2 lines
01-27 08:44:29.911 11471 11471 W StaticLayout: maxLineHeight should not
be -1.=C2=A0 maxLines:1 lineCount:1
01-27 08:44:30.937 11471=C2=A0 2660 D WireGuard/GoBackend: Changing tunne=
l
xand to state DOWN
01-27 08:44:30.938 11471=C2=A0 2660 I WireGuard/GoBackend: Bringing tunne=
l down
01-27 08:44:30.939 11471=C2=A0 2660 I WireGuard/GoBackend/xand: Device cl=
osing
01-27 08:44:30.939 11471 25836 D WireGuard/GoBackend/xand: Routine:
event worker - stopped
01-27 08:44:30.939 11471 25836 D WireGuard/GoBackend/xand: Routine:
receive incoming IPv4 - stopped
01-27 08:44:30.940 11471 25886 D WireGuard/GoBackend/xand: Routine:
receive incoming IPv6 - stopped
01-27 08:44:30.940 11471=C2=A0 2660 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Stopping...
01-27 08:44:30.941 11471 25886 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Routine: nonce worker - stopped
01-27 08:44:30.941 11471 25886 D WireGuard/GoBackend/xand: Routine:
decryption worker - stopped
01-27 08:44:30.941 11471 25886 D WireGuard/GoBackend/xand: Routine:
encryption worker - stopped
01-27 08:44:30.941 11471 25836 D WireGuard/GoBackend/xand: Routine:
encryption worker - stopped
01-27 08:44:30.941 11471 25886 D WireGuard/GoBackend/xand: Routine:
handshake worker - stopped
01-27 08:44:30.941 11471 25836 D WireGuard/GoBackend/xand: Routine:
decryption worker - stopped
01-27 08:44:30.941 11471 25886 D WireGuard/GoBackend/xand: Routine:
handshake worker - stopped
01-27 08:44:30.942 11471 25886 D WireGuard/GoBackend/xand: Routine:
decryption worker - stopped
01-27 08:44:30.942 11471 25886 D WireGuard/GoBackend/xand: Routine:
encryption worker - stopped
01-27 08:44:30.942 11471 25886 D WireGuard/GoBackend/xand: Routine:
encryption worker - stopped
01-27 08:44:30.942 11471 25886 D WireGuard/GoBackend/xand: Routine:
decryption worker - stopped
01-27 08:44:30.942 11471 25886 I chatty=C2=A0 :
uid=3D10139(com.wireguard.android) AsyncTask #2 identical 3 lines
01-27 08:44:30.942 11471 25886 D WireGuard/GoBackend/xand: Routine:
decryption worker - stopped
01-27 08:44:30.942 11471 25886 D WireGuard/GoBackend/xand: Routine:
encryption worker - stopped
01-27 08:44:30.943 11471 25886 I chatty=C2=A0 :
uid=3D10139(com.wireguard.android) AsyncTask #2 identical 2 lines
01-27 08:44:30.943 11471 25886 D WireGuard/GoBackend/xand: Routine:
encryption worker - stopped
01-27 08:44:30.943 11471 25886 D WireGuard/GoBackend/xand: Routine:
handshake worker - stopped
01-27 08:44:30.943 11471 25886 I chatty=C2=A0 :
uid=3D10139(com.wireguard.android) AsyncTask #2 identical 4 lines
01-27 08:44:30.943 11471 25886 D WireGuard/GoBackend/xand: Routine:
handshake worker - stopped
01-27 08:44:30.943 11471 25886 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Routine: sequential receiver - stop=
ped
01-27 08:44:30.943 11471 25886 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Routine: sequential sender - stoppe=
d
01-27 08:44:31.019 11471=C2=A0=C2=A0 582 D WireGuard/GoBackend/xand: Rout=
ine: TUN
reader - stopped
01-27 08:44:31.019 11471=C2=A0 2660 I WireGuard/GoBackend/xand: Interface=
 closed
01-27 08:44:32.359 11471=C2=A0 2720 D WireGuard/GoBackend: Changing tunne=
l
xand to state UP
01-27 08:44:32.360 11471=C2=A0 2720 I WireGuard/GoBackend: Bringing tunne=
l up
01-27 08:44:32.388 11471=C2=A0 2720 D WireGuard/GoBackend: Go backend
v0.0.20181018
01-27 08:44:32.388 11471=C2=A0 2720 D WireGuard/GoBackend/xand: Debug log=
 enabled
01-27 08:44:32.388 11471=C2=A0 2720 I WireGuard/GoBackend/xand: Attaching=
 to
interface tun0
01-27 08:44:32.404 11471 25835 D WireGuard/GoBackend/xand: Routine:
decryption worker - started
01-27 08:44:32.404 11471 25907 D WireGuard/GoBackend/xand: Routine:
handshake worker - started
01-27 08:44:32.404 11471 25907 D WireGuard/GoBackend/xand: Routine:
encryption worker - started
01-27 08:44:32.404 11471 25907 D WireGuard/GoBackend/xand: Routine:
decryption worker - started
01-27 08:44:32.404 11471 25835 D WireGuard/GoBackend/xand: Routine:
handshake worker - started
01-27 08:44:32.404 11471 25835 D WireGuard/GoBackend/xand: Routine:
handshake worker - started
01-27 08:44:32.404 11471 25907 D WireGuard/GoBackend/xand: Routine:
encryption worker - started
01-27 08:44:32.404 11471 25907 D WireGuard/GoBackend/xand: Routine:
encryption worker - started
01-27 08:44:32.404 11471 25907 D WireGuard/GoBackend/xand: Routine:
decryption worker - started
01-27 08:44:32.404 11471 25907 D WireGuard/GoBackend/xand: Routine:
encryption worker - started
01-27 08:44:32.404 11471 25907 D WireGuard/GoBackend/xand: Routine:
handshake worker - started
01-27 08:44:32.404 11471 25907 D WireGuard/GoBackend/xand: Routine:
encryption worker - started
01-27 08:44:32.404 11471 25907 D WireGuard/GoBackend/xand: Routine:
decryption worker - started
01-27 08:44:32.404 11471 25907 D WireGuard/GoBackend/xand: Routine:
handshake worker - started
01-27 08:44:32.404 11471 25907 D WireGuard/GoBackend/xand: Routine:
decryption worker - started
01-27 08:44:32.404 11471 25835 D WireGuard/GoBackend/xand: Routine:
decryption worker - started
01-27 08:44:32.404 11471=C2=A0=C2=A0 582 D WireGuard/GoBackend/xand: Rout=
ine:
encryption worker - started
01-27 08:44:32.404 11471 25907 D WireGuard/GoBackend/xand: Routine:
handshake worker - started
01-27 08:44:32.404 11471 26035 D WireGuard/GoBackend/xand: Routine:
event worker - started
01-27 08:44:32.404 11471=C2=A0=C2=A0 582 D WireGuard/GoBackend/xand: Rout=
ine:
decryption worker - started
01-27 08:44:32.404 11471=C2=A0=C2=A0 582 D WireGuard/GoBackend/xand: Rout=
ine:
encryption worker - started
01-27 08:44:32.404 11471=C2=A0=C2=A0 582 D WireGuard/GoBackend/xand: Rout=
ine:
encryption worker - started
01-27 08:44:32.404 11471=C2=A0=C2=A0 582 D WireGuard/GoBackend/xand: Rout=
ine:
handshake worker - started
01-27 08:44:32.404 11471=C2=A0=C2=A0 582 D WireGuard/GoBackend/xand: Rout=
ine:
decryption worker - started
01-27 08:44:32.404 11471=C2=A0=C2=A0 582 D WireGuard/GoBackend/xand: Rout=
ine:
handshake worker - started
01-27 08:44:32.404 11471=C2=A0=C2=A0 582 D WireGuard/GoBackend/xand: Rout=
ine: TUN
reader - started
01-27 08:44:32.405 11471=C2=A0 2720 D WireGuard/GoBackend/xand: Interface=
 has
MTU 1280
01-27 08:44:32.405 11471=C2=A0 2720 D WireGuard/GoBackend/xand: UAPI:
Updating private key
01-27 08:44:32.405 11471=C2=A0 2720 D WireGuard/GoBackend/xand: UAPI:
Removing all peers
01-27 08:44:32.405 11471=C2=A0 2720 D WireGuard/GoBackend/xand: UAPI:
Transition to peer configuration
01-27 08:44:32.406 11471=C2=A0 2720 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - UAPI: Created
01-27 08:44:32.406 11471=C2=A0 2720 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - UAPI: Adding allowedip
01-27 08:44:32.406 11471=C2=A0 2720 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - UAPI: Updating endpoint
01-27 08:44:32.406 11471 25836 D WireGuard/GoBackend/xand: Routine:
receive incoming IPv6 - started
01-27 08:44:32.406 11471 26035 D WireGuard/GoBackend/xand: Routine:
receive incoming IPv4 - started
01-27 08:44:32.407 11471=C2=A0 2720 D WireGuard/GoBackend/xand: UDP bind =
has
been updated
01-27 08:44:32.407 11471=C2=A0 2720 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Starting...
01-27 08:44:32.407 11471 25907 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Routine: sequential receiver - star=
ted
01-27 08:44:32.407 11471 25907 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Routine: nonce worker - started
01-27 08:44:32.407 11471 25907 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Routine: sequential sender - starte=
d
01-27 08:44:32.407 11471=C2=A0 2720 I WireGuard/GoBackend/xand: Device st=
arted
01-27 08:44:34.278 11471 11471 I am_on_paused_called:
[0,com.wireguard.android.activity.MainActivity,performPause]
01-27 08:44:34.306 11471 11471 I am_on_stop_called:
[0,com.wireguard.android.activity.MainActivity,STOP_ACTIVITY_ITEM]
01-27 08:44:34.988 11471 25828 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Sending handshake initiation
01-27 08:44:34.991 11471 25828 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Awaiting keypair
01-27 08:44:35.010 11471 25878 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Received handshake response
01-27 08:44:35.010 11471 25878 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Obtained awaited keypair
01-27 08:44:55.759 11471 11471 I am_on_restart_called:
[0,com.wireguard.android.activity.MainActivity,performRestartActivity]
01-27 08:44:55.759 11471 11471 I am_on_start_called:
[0,com.wireguard.android.activity.MainActivity,handleStartActivity]
01-27 08:44:55.760 11471 11471 I am_on_resume_called:
[0,com.wireguard.android.activity.MainActivity,RESUME_ACTIVITY]
01-27 08:44:55.776 11471 29166 D DecorView:
onWindowFocusChangedFromViewRoot hasFocus: true,
DecorView@4f9eb36[MainActivity]
01-27 08:44:59.438 11471 11471 I menu_item_selected: [0,Settings]
01-27 08:44:59.458 11471 11471 I am_on_paused_called:
[0,com.wireguard.android.activity.MainActivity,performPause]
01-27 08:44:59.473 11471 11471 W ActivityThread: handleWindowVisibility:
no activity for token android.os.BinderProxy@7cea8a8
01-27 08:44:59.486 11471 11471 I am_on_create_called:
[0,com.wireguard.android.activity.SettingsActivity,performCreate]
01-27 08:44:59.538 11471 11471 I am_on_start_called:
[0,com.wireguard.android.activity.SettingsActivity,handleStartActivity]
01-27 08:44:59.539 11471 11471 I am_on_resume_called:
[0,com.wireguard.android.activity.SettingsActivity,RESUME_ACTIVITY]
01-27 08:44:59.559 11471 29166 D DecorView:
onWindowFocusChangedFromViewRoot hasFocus: true,
DecorView@3c79925[SettingsActivity]
01-27 08:45:00.046 11471 11471 I am_on_stop_called:
[0,com.wireguard.android.activity.MainActivity,STOP_ACTIVITY_ITEM]
01-27 08:45:03.661 11471 28675 D WireGuard/GoBackend/xand:
peer(HNgO=C3=A2=E2=82=AC=C2=A6hqRE) - Receiving keepalive packet
01-27 08:45:05.073 11471 11471 I am_on_paused_called:
[0,com.wireguard.android.activity.SettingsActivity,performPause]
01-27 08:45:07.092 11471 29166 D DecorView:
onWindowFocusChangedFromViewRoot hasFocus: true,
DecorView@3c79925[SettingsActivity]
01-27 08:45:07.095 11471 11471 I am_on_activity_result_called:
[0,com.wireguard.android.activity.SettingsActivity,ACTIVITY_RESULT]
01-27 08:45:07.111 11471 11471 I am_on_resume_called:
[0,com.wireguard.android.activity.SettingsActivity,RESUME_ACTIVITY]



--YP6As8SAjOsS3XKyTqxUYMK2GNRkM9sKi--

--vbot0j0xNHjlrzdKZnN5N4t5T06MMWNDf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEVy5ZREGPoYoDU9vApTw/wGTQewcFAlxNdVMACgkQpTw/wGTQ
ewennA//WL0qORSyGj2KdPFBBg/uR2Mn2yKg2JjxX2FMdZT3oqbD8gio6yjKJX9y
Xu/4/PzNcQYr8laZO/hSBQ/ahvU45ew5c1Yp4UJXxqOiHU8aZ5hTrYdpoxLicRxB
6XJX8tasl1RqBVGLGk4xEBNyBt/sZRohj2be4PpiO1GuP1VRVFqtAHD2Cbn5nuN2
ysjOihqqBINnVqd1LAPPGlPlnxEtPIUvVO3P4APjRitx6OsqpXNRuoS9qlf8U0vj
B9iN9ad8o55W8UB2ugYhJu8wkoyuCfS+AHjGI9locu7xajrxE+E44bDlZNoj0PKL
68BJMuZmHe7TI3U5jBOuO5z26PUZSBD4VJjFOZ1emtpMs6t1ofWSXxC9jlN+QNuk
pV73P795+FLKfdCojie5U2J6TSxrNZd24v9PPtdh4QzAjiqGe0fQtRd3dusXKcJT
I+L+b7zojW6ibYEftnwQmGcZnuAVUCj+mXsMawbVntrzDGvAk+vmrOLWZ/63a7VG
pjSaUQwHBvYr8y3pVl9lvaLpMg4UPWKqCJ1C2NhyPk9QrzsNSRXkzL4GzhA3VIRB
3qOiDUasj+y2Ru1IjOaOYXb/5gpKW26bXgPJJaVkBu+rbtAKuK7HlCu4wFafkOvY
YqKNHGW7U7oAPuWgK/OcmUzpTJcDl4EfQv6qsa9pNte1/s7A25c=
=SWBL
-----END PGP SIGNATURE-----

--vbot0j0xNHjlrzdKZnN5N4t5T06MMWNDf--

--===============7589511008003073509==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7589511008003073509==--
