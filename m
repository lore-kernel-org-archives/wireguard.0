Return-Path: <SRS0=EmC4=DQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB981C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  9 Oct 2020 14:19:54 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E9A02222F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  9 Oct 2020 14:19:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E9A02222F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=spam-free.eu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 80b08106;
	Fri, 9 Oct 2020 13:46:33 +0000 (UTC)
Received: from s2.spam-free.eu (s2.spam-free.eu [195.5.121.125])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5928a2b0
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 9 Oct 2020 13:46:31 +0000 (UTC)
Received: from [192.168.136.206] (ip-178-200-219-233.hsi07.unitymediagroup.de
 [178.200.219.233])
 by s2.spam-free.eu (Postfix) with ESMTPSA id 78B611C0CA5
 for <wireguard@lists.zx2c4.com>; Fri,  9 Oct 2020 16:19:23 +0200 (CEST)
From: Chris <wireguard@spam-free.eu>
Subject: Re: [FR] How can I expose the wireguard tunnel as a socks5 proxy on
 the client?
To: wireguard@lists.zx2c4.com
References: <CAE9z9A0H8t3op=ewTCUhZXeOoprWEquiiH77mUN_C8EMvwiF2w@mail.gmail.com>
 <20201009182214.0169140f@natsu>
Message-ID: <d888c808-fffb-1d61-cdf4-752e61e33fd1@spam-free.eu>
Date: Fri, 9 Oct 2020 16:19:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201009182214.0169140f@natsu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: de-DE
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

Maybe I oversimplify your problem, but from what I read, your standard route 
will be using the Iranian net.
And - I guess - it is only a limited numer of IP addresses, that you would like 
to reach through the tunnel.

I don't know your OS, but simply adding ip routes pointing to the tunnel for the 
desired destinations would do the job.

Chris


On 09/10/2020 15:22, Roman Mamedov wrote:
> On Sun, 4 Oct 2020 15:41:52 +0330
> Rudi C <rudiwillalwaysloveyou@gmail.com> wrote:
>
>> I use Wireguard to circumvent Iran's censorship. A major problem with
>> it is that it's very hard to selectively proxy specific domains/apps
>> through Wireguard, while leaving others alone. This is an essential
>> feature for Iran's internet, as:
>> 1. The connection is terrible, so avoiding using the proxy for
>> uncensored sites helps a lot.
>> 2. International traffic is 2x more expensive, so avoiding the proxy
>> for internal traffic is very beneficial.
>> 3. Some internal sites ban international IPs and need Iranian IPs.
>>
>> The easiest way to solve this program, as far as I understand, is to
>> add the ability to expose the tunnel as a socks5 proxy on the client
>> side. This is the approach that shadowsocks, v2ray, etc have adopted.
>> There are mature solutions to selectively routing traffic through a
>> socks proxy.
>>
>> I searched around, and there are docker containers that already do
>> this wireguard-to-socks thing; But running docker is expensive on a
>> non-Linux machine, so it'd be much appreciated if you could support
>> exposing socks and HTTP proxy servers natively.
> If you tunnel to a VPS abroad, just install a SOCKS proxy on the remote end.
> A good one is [1]. Then set the remote end's in-VPN IP and proxy port in your
> apps to use.
>
> [1] https://socks-relay.sourceforge.io/
>
> To separate which sites use which proxy (or no proxy) SwitchSharp for Chrome
> and FoxyProxy for Firefox, but you probably already know about those.
>
> In case you meant connecting to commercial "VPN" services, then yes it
> becomes a bit more complex, but you can try srelay on the local machine and
> use the "-J" option, "outbound interface name". But I'm not sure if that would
> just work on its own, or also needs some help from ip(6)tables or ip-rule.
>


