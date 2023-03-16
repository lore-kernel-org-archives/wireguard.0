Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8857CC74A5B
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Mar 2023 16:38:29 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fe67a919;
	Thu, 23 Mar 2023 16:38:27 +0000 (UTC)
Received: from out-59.mta0.migadu.com (out-59.mta0.migadu.com [91.218.175.59])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7f46c3e4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Mar 2023 16:58:57 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=augendre.info;
 s=key1; t=1678985937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WxHRENm6hnx7J8d5Dbx/QQgUp5hc7g/mmV+41o/6CWE=;
 b=aUjcg5JHMM5cX0ZIx2YR9Yor1nAVG218uQlkjE9iv7upQtTXwvRYaa6X71vYPXatd1uoFQ
 HJOd439eyln7KHU6fjWCOUU8HtonIyQ5I1Qw2iiEdhKHDatFxuqEUAgq2yCuUoY5etPnYo
 C2bVMDBMYKeP3+WuN5SIuR1Q6rGWlCq+T7chHFUdNSDQkS51SggHNnmWRQG7X65Aw5zl/9
 p++5IjnEogJSNyNk5+Tmxit3CknQDg50iT7o4nRzIkyE2dBf/oo/qKSgnZVescU44F6RlI
 Nlbm8hXtyMuaeu07EBKCelnKMfZCSn+GvSstMdML39OXMcB3abcPJCw8AxcBhg==
From: Gabriel Augendre <gabriel@augendre.info>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: macOS on-demand Wi-Fi space at the beginning of SSID doesn't work as
 expected
Message-Id: <8DFC7AF6-8476-421B-93BC-766C6714E178@augendre.info>
Date: Thu, 16 Mar 2023 17:58:45 +0100
To: wireguard@lists.zx2c4.com
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Thu, 23 Mar 2023 16:38:25 +0000
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hello,

I hope this is the right place to submit what, in my opinion, is a bug.

I'm using Wireguard on macOS, installed from the App Store[1].
App version: 1.0.16 (27)
Go backend version: 1e2c3e5a

[1]: https://apps.apple.com/fr/app/wireguard/id1451685025?mt=3D12

I'm unable to add an SSID starting with a space in the on-demand =
except/only configuration. The app strips the whitespace at the =
beginning of the SSID.

Steps to reproduce:
1. Install WireGuard
2. Setup a tunnel
3. Enable On-Demand Wi-Fi
4. Select "Only these SSIDs" or "Except these SSIDs"
5. Type an SSID name starting with a space
6. Type Enter or Tab to validate the selection

Notice how the space at the beginning of the SSID has disappeared in the =
text box. Also, the configuration treats the SSID with no space at the =
beginning. If you opted for "only" this SSID and you're connected to it, =
then WireGuard won't connect. If you selected "except", then WireGuard =
will connect anyway.

The iOS app doesn't seem affected by this bug. Selecting a known SSID =
starting with a space works as expected.

I'd be glad to contribute a patch but I have no experience in Swift =
programming.
I'm guessing the issue lies somewhere in =
Sources/WireGuardApp/UI/ActivateOnDemandViewModel.swift though.

Regards,

--=20
Gabriel Augendre

