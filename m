Return-Path: <SRS0=izSP=KQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90844C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 21 May 2021 00:04:51 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 797AB61244
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 21 May 2021 00:04:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 797AB61244
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7ddfdb0e;
	Fri, 21 May 2021 00:04:48 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4fabe15b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 20 May 2021 19:23:52 +0000 (UTC)
Received: from [192.168.0.193] ([95.222.31.178]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MDhpZ-1lZas41yoZ-00Anfb; Thu, 20 May 2021 21:23:51 +0200
Subject: Re: lost connection on dynamic IP
To: Roman Mamedov <rm@romanrm.net>, Vicente Bergas <vicencb@gmail.com>
Cc: wireguard@lists.zx2c4.com
References: <CAAMcf8BeGzUppFzfc2hF9KvpfU1DfSpncYv4AaK5Qf8_+fC-Rw@mail.gmail.com>
 <20210519234310.66ea294e@natsu>
 <CAAMcf8A9isAqhsXLHw1=8A6pyeDeXBPUan6s7_11_tDXJmg-jw@mail.gmail.com>
 <20210520111530.4568a14f@natsu> <20210520212056.1ddd3d5a@natsu>
From: Max Schulze <max.schulze@online.de>
Message-ID: <cfef7862-cae8-6d13-269b-d01aa6f0a2b4@online.de>
Date: Thu, 20 May 2021 21:23:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20210520212056.1ddd3d5a@natsu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Provags-ID: V03:K1:YbcEMCjVn9lknoZtn2DNv80JQwRkEKYacGVPaAi70NYLzHc2k0Y
 eJqruih2ysqGcvCaPwBFF6OXbLzxkOl/guX2WFuluuxwOTJ3WT7ASOOuvNcUsLmkDxRXGL2
 gP7hXpB7OSX2udlJLHonucausWOnfiiZhF3Vdu9fMTLSBp2p72dn1qlqgs7SLinrXoDtYy5
 CZ1HYk56kHOJ2YuOjNAww==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Xb5WB8qB3dE=:mbu2DqhiXBx52Zw+z1sLSw
 DaunK24rS4qgpjVkhXlBsDGN9Xr04jM8NddC7GRT1z/jUKuOIpqSN9lEICa7yCi8/fL7YnHpA
 teNkyijtZYIzmS+KkGPT5z6WWpn65zsa6K3SVVe37dn8tNfFXCsU8sSbQ/XzEfK1dQ9UZUVST
 YQeawV0SEJXAwDTG5Z+qQskGPcnakDe59ucl93xSYdCxqLNvg6xqbE36XjVk/bXQYeayIVu6u
 1guXjRSz3fuE7qZRahCpz8pWVpEgVSU6mrPQipjyXFQqLYwX5na051PggvGXH1B2ZSaiK3P8d
 nB7xL6frs8M0kCWBQdqmNodNbBJz6H90+BbSY3jmDJkypeWzQn+olCExM0MonLch9riO9PdMM
 CGbTUKRArpVM09fY17dMc/xVN/OR9wzK5kUnshssoAdFun52y04ZAWC3Vc70NJoB3RnLb0Ikl
 wM6yVFel/XRXvR2sHbkmxJs/tMKuDpR4A/vSX+tXirZuNcCRAFfHLnuwYVYoRe6ZWg1DM4jFB
 eRqmBDnx4Ht1GrMlVKYi9k=
X-Mailman-Approved-At: Fri, 21 May 2021 00:04:47 +0000
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


On 20.05.21 18:20, Roman Mamedov wrote:
> On Thu, 20 May 2021 11:15:30 +0500
> Roman Mamedov <rm@romanrm.net> wrote:
>
>>> So, what do you mean is that wireguard does a single DNS resolution at
>>> the beginning and further DNS resolutions need to be done elsewere. Is
>>> that correct?
>> Yes.
> I also remembered a case where just PersistentKeepalive won't save you, and
> periodic DNS resolution on clients becomes mandatory. It is when the server's
> physical location gets a power cut. On new boot-up (and router power-on) it
> gets a new IP from the ISP, and has no idea where all the clients are. The
> communication is broken until clients recheck the DNS record and update the
> server's endpoint from that. WG does not do this on its own.
>

Just to point out what 'others are doing' - openwrt has a watchdog 
script [1] that might be run with cron every 15 mins


*/15 * * * * /usr/bin/wireguard_watchdog


which will update the new endpoint if the last handshake is too old:

wg set ${iface} peer ${public_key} endpoint 
"${endpoint_host}:${endpoint_port}"


It needs PersistenKeepalive also, if i understand correctly.

[1] 
https://git.openwrt.org/?p=openwrt/openwrt.git;a=blob;f=package/network/utils/wireguard-tools/files/wireguard_watchdog;hb=HEAD


--

Max

