Return-Path: <SRS0=1oQw=5P=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 749F9C43331
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Mar 2020 02:24:53 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D75E20578
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Mar 2020 02:24:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D75E20578
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=johnnyutahh.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6cd48098;
	Mon, 30 Mar 2020 02:10:49 +0000 (UTC)
Received: from smtp-out-4.mxes.net (smtp-out-4.mxes.net [198.205.123.69])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d4a80996
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 21 Mar 2020 21:38:22 +0000 (UTC)
Received: from [IPv6:2605:a601:aa2e:ec00:b0b3:1f33:e716:8c83] (unknown
 [IPv6:2605:a601:aa2e:ec00:b0b3:1f33:e716:8c83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.mxes.net (Postfix) with ESMTPSA id D7D3C75983;
 Sat, 21 Mar 2020 17:45:07 -0400 (EDT)
Subject: Re: WireGuard for macOS
To: wireguard@lists.zx2c4.com
Cc: Eiji Tanioka <tanioka404@gmail.com>, tormen@mail.ch
References: <F77DB7FE-175E-48E4-A071-FF86D290B494@mail.ch>
 <CAA2ss9EE35hYqjOC_uY9REe-Mp0D04bPH9Ldg0wConQs8VG24A@mail.gmail.com>
From: Johnny Utahh <mailman-wireguard.com@johnnyutahh.com>
Message-ID: <0f81834c-6f8a-57a9-1376-e6c310aa9c5e@johnnyutahh.com>
Date: Sat, 21 Mar 2020 16:45:02 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAA2ss9EE35hYqjOC_uY9REe-Mp0D04bPH9Ldg0wConQs8VG24A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Sent-To: <d2lyZWd1YXJkQGxpc3RzLnp4MmM0LmNvbQ==>
X-Mailman-Approved-At: Mon, 30 Mar 2020 04:10:43 +0200
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

The macOS wireguard-tools command line does not seem to work=20
concurrently with the GUI app, at least on my system:

https://www.reddit.com/r/WireGuard/comments/fmn93h/how_to_display_or_mana=
ge_macos_wireguard_status

Anybody know why?


On 2020-03-07 10:18 PM, Eiji Tanioka wrote:
> Hi,
>
> How about install wireguard-tools from Homebrew ?
> https://www.wireguard.com/install/#macos-homebrew-and-macports-basic-cl=
i-homebrew-userspace-go-homebrew-tools-macports-userspace-go-macports-too=
ls
>
> I have not installed, it seems installing `wg`, `wg-quick` command and
> "wireguard-go" backend.
> I think you can use them for Connect / Disconnect from CLI.
>
> And,
>> I would love to use both (GUI + CLI): No automatic connect in the GUI,
> I'm using "On-Demand" option for automatic connect, is it appropriate
> for your purpose?
>
> Regards,
>
> 2020=E5=B9=B43=E6=9C=888=E6=97=A5(=E6=97=A5) 10:01 <tormen@mail.ch>:
>> Dear Wireguard Team,
>>
>> First off, thanks a lot for the client for macOS !!
>>
>> Is there a possibility to issue a "Connect" / "Disconnect" command fro=
m the command line
>> instead of using the buttons in the GUI ?
>>
>> I would love to use both (GUI + CLI): No automatic connect in the GUI,=
 but rather automatically connect / reconnect via script (so via command-=
line interface, CLI).
>> And I don't like the idea of not using the GUI and switching to the cl=
i version as then I don't have the icon.
>>
>> Thanks a lot in advance for any hint or feedback!
>>
>> Tormen

