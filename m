Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E57C77B61
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Apr 2023 12:01:35 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2d3ac6a2;
	Sat, 8 Apr 2023 12:01:33 +0000 (UTC)
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3b575d08
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 8 Apr 2023 12:01:31 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1pl7G6-0003lE-Gc; Sat, 08 Apr 2023 14:01:30 +0200
Message-ID: <1190d45f-28fd-271d-bfd7-e37c1e2acd7d@leemhuis.info>
Date: Sat, 8 Apr 2023 14:01:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: Possible regression between 5.18.2 and 6.2.1
Content-Language: en-US, de-DE
To: Dan Crawford <dnlcrwfrd@gmail.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <CQZ7HWJCK18F.1AUR9FMHKPOXB@crawfs>
 <CAHmME9qi=26zP-A14pLVxtL86Zj1P-+i93t=_BnSd0t1Dj_U8A@mail.gmail.com>
 <CRLVEG5VRA7S.2XBZXJENZM4HK@crawfs>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <CRLVEG5VRA7S.2XBZXJENZM4HK@crawfs>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1680955291;
 62092bc9; 
X-HE-SMSGID: 1pl7G6-0003lE-Gc
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On 02.04.23 03:14, Dan Crawford wrote:
> Thanks for the suggestions. I've done some bisecting and I've found
> that the issue appears due to wg-quick, which means I can easily work
> around it. First, apologies but there's a typo in my original
> email, I upgraded from 5.12.8, not 5.18.2.
> 
> On versions prior to 5.14.0, wg-quick correctly adds routes for the
> appropriate addresses (line 341 and then line 177). However, on versions
> after 5.14.0, the condition doesn't work quite right and the ip route
> add command does not run (line 177).
> 
> To investigate this I print ip -4 route show dev wg1 match 192.168.1.3,
> on both 5.13.0 and 5.14.0, at line 177.
> 
> On 5.13.0 I get no output, and the ip route add command runs.
> However, on 5.14.0 the output is
> 
> 192.168.1.0/24 proto kernel scope link src 192.168.1.0 

Thx for your investigation.

This per the Linux kernel policy might qualify as regression. But the
thing is: the change was introduced quite a while ago already, hence
fixing it now might itself lead to other regressions, as other scripts
might have started to rely on the new behavior. If anyone wanted to
discuss this upstream we'd also likely need a bisection to know which
change caused the new behavior. Given all this and the relative simple...

> and so the ip route add command does not run.
> 
> Obviously I can easily work around the issue by patching the conditional
> out of wg-quick. But I don't have any clue why the output of ip varies
> between 5.13 and 5.14. I'm also surprised no-one has encountered
> this issue either (unless I missed something while searching).
> 
> Possibly one way to resolve the issue is to replace the conditional with
> 
> [[ -n $(ip $proto route show dev "$INTERFACE" match "$1" proto boot 2>/dev/null) ]]

...workaround you apparently have found I'd say it's better to fix this
in wg-quick. I'll thus for now will remove this from the list of tracked
Linux kernel regressions:

#regzbot inconclusive: small change broke script, workaround found;
fixing this now might lead to other regressions
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.



> On Fri Mar 31, 2023 at 1:39 AM AEDT, Jason A. Donenfeld wrote:
>> Hi Dan,
>>
>> Hard to imagine that this is a WireGuard bug, but more likely
>> something having to do with SNAT or something.
>>
>> What is the unallowed src IP when you get that error? Can you debug
>> further? Maybe bisect a bit? Otherwise, not much I can do.
>>
>> The diff between those versions you listed is pretty minimal, so I
>> suspect your bug is elsewhere.
>>
>> Jason
> 
> 
