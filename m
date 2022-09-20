Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B7EFC6FA82
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Sep 2022 10:21:19 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 3917a5f7;
	Wed, 28 Sep 2022 10:21:03 +0000 (UTC)
Received: from a1872.mx.srv.dfn.de (a1872.mx.srv.dfn.de [194.95.232.134])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id eb8de6c6
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Sep 2022 13:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 hochschule-stralsund.de; h=content-transfer-encoding
 :content-type:content-type:subject:subject:from:from
 :content-language:user-agent:mime-version:date:date:message-id
 :received; s=s1; t=1663679790; x=1665494191; bh=gSv43NADi+20FTwl
 zJAmt9dFNdeT/62ImD95mDVIr3o=; b=jIHMKxVqWoqr98RNc01OzO45sietVyM/
 bfld02xgJ/9I4hTJBW1NGt+BdNTKYxS3ZA+d67yzLSzTjlUaQ7r79d42w7+3X0G2
 m4mLTmJLC1E7Y45amIbRTsaGHwC2Z+yay9IJFQO6g+cYe2E2WEsfjleGkLf+rOJV
 Dj/Vnar9bio=
Received: from mail.hochschule-stralsund.de (mail.hochschule-stralsund.de
 [194.94.72.163])
 by a1872.mx.srv.dfn.de (Postfix) with ESMTPS id E46B52A005A
 for <wireguard@lists.zx2c4.com>; Tue, 20 Sep 2022 15:16:30 +0200 (CEST)
Received: by smtp.hochschule-stralsund.de
Message-ID: <4e093a02-723d-22ff-fd33-f220ac24e19e@hochschule-stralsund.de>
Date: Tue, 20 Sep 2022 15:16:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
From: Jan Petrischkeit <jan.petrischkeit@hochschule-stralsund.de>
Subject: wireguard-windows: Wireguard does not start a previously activated
 tunnel from time to time
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 28 Sep 2022 10:20:52 +0000
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

Dear Wireguard Community,

I have the problem that Wireguard on some systems and there only from 
time to time forgets to activate the tunnel at system startup.
Mainly this happens after an update of the wireguard client or changes 
to the client config. If an admin then reactivates the tunnel, it will 
(mostly) run on the following system starts.
My users have no way to disable the tunnel. At least in the past, but 
the problem has come up so often now that I've started making the 
LimitedOperatorGUI available to them to be able to activate the tunnel.

One user (Denis Brodbeck @ 2021-07-06 6:18 UTC) had already sent a mail 
to this list about this problem (Title: "wireguard-windows: client 
forgets after restart that there was an activated tunnel before and 
won't activate said tunnel anymore"), my environment and experiences 
pretty much match his descriptions.
However, I am fairly unexperienced with mailing lists, so I don't know 
how to directly reply to that entry.

However, I have two systems so far where the tunnel never starts 
automatically on boot. On these systems I noticed that Windows notes a 
corresponding entry in the event viewer (translated from german to english):

Event 7023, ServiceControlManager: The service 
"WireGuardTunnel$HOST-WG2" was terminated with the following error: The 
requested name is valid, but no data of the requested type was found.

If I set the tunnel's service to Delayed Start, it works, but usually 
only some time after the user logs in. It also works if I start the 
service manually before Delayed Start becomes active.
If I don't set the startup type of the tunnel to "Delayed start", the 
service entry for the tunnel disappears from the services list after the 
next restart (and the error message in the event viewer).


Hope someone has some pointers on how to resolve this.

Cheers,
Jan Petrischkeit

