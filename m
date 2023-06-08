Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946D3C7EE29
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  8 Jun 2023 12:11:04 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a460123f;
	Thu, 8 Jun 2023 12:11:02 +0000 (UTC)
Received: from sonic302-20.consmr.mail.ir2.yahoo.com
 (sonic302-20.consmr.mail.ir2.yahoo.com [87.248.110.83])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 08585295
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 8 Jun 2023 12:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.uk; s=s2048;
 t=1686226260; bh=xskhfeWWStxCLelWueTp+hI1ZQcnFqPFrjUUsuUJH6o=;
 h=Date:Subject:To:References:From:In-Reply-To:From:Subject:Reply-To;
 b=QgNXEWGovRF4lLqmSHBMUw4YVlOjz46iNIa2r5Oyg1a4ApuCyWnm23uL3bBRcweMHD8M++AXQ9tQbdIuDN1MgEVTZ2HWZ4ce0svHzygHpHQGbqAZ0c33ZWvEmAfTR/Y2F/f8nw1nTe9KFUJzpyHIhvN4b7wEUoAC2xmdJs1N+tXqK5v5DZJo1rtpV3ujPPUiPOm98hs64UWDrsanIYoq4DJcbmDKOgile9WFJV8aJNkCD+J/e3ow8kT6yAXX3rLagp8Apr2ZTT50Luy7nBALNy/SLE7QY3RAe3W7cNY8yqWDGirFxiANiwEeNtehav1Ys7BF+foxyNFSHkgE++YYxw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1686226260; bh=zfy4J1pl09LAwyqLJlRXGHcSuWOAI0nJ7hsO3LvRGn6=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=RnHXWvJ8Y7EOANjFbTYAKiLF3l3PWMsD6qKJTNG8i69Qd4Z2YEWG5ASZtOBfrPNt6vrgCGQU0i9PfiYd/sCD/eoxyd/YY9wKuMTULmnIi4VQF66UH5W2NHkRI7bMNy29dK5wYXyxKqfGKJlqWO2Eml5WNrNECXlh3e17zXEZfWITPFtt7t+i0cyMXbLc8t2l6dBHJC/qiUNx4SHxkk1joqOABX+x4kEDGbcsniwiH5QannM6GI59Nq51pkCuNyl9HO5b6vCls/3r0itXcUpn/XvJWsMmYep5d5yhII4NdACGTQuGofZ/sgEaGcS/neBZ54Aj6pTHR2/13rIWqv7+lQ==
X-YMail-OSG: Npsk24wVM1lS8A2N8Rx271c19Wg5ZcPW1Iu9i693N3VJUNOdwixowJg.jeqjhl1
 T6Oz579bKnWte44Xse.gHkzkd3stStQ4fNcF6164RIc9ktANmd5pDKwHRihBJUnp0QWrv4KxUCC5
 KA4fHI8qdhXbw1BsTRn4MNEWqwVcX24VbtIex0Wy.JgajJH62aokxwqO1NtXSrLrvRrNE7NDpPYy
 vxIHju2zDWqmQyS5NlXYjX4mXEE7HfTygungXwgRn1p1DNNhci1OmvXbtheWS2GGmSJhHtfNsJw2
 urBoWExzXRCTbXX1NMNDNt5tYaHd6PAn0wQ3GDC0qWyqsB1.rXHS3X07t1g0iGp0fY3GbR2TKvh2
 H1QgRCLyuSeh2kBrqrO94pLxnZU7zmclo9v7lZJnyypOFHo1xvrBbNtV2WXGJiS1g93T6CPTt_nx
 vTMfhNUwzpE5ftK5dmPxm2O7vIhtqxNSkBjrr.T1VVUkD5nlk0n0pEIpi13VVUlA6YQbd6M7sXEX
 j76YyWdpPrv.53a_dN0YVScGTRQ7KNnJQhfKRhxzqhk_7nD77adTdJh4FESZfTNhrgMYga7S5_At
 LqvGlxPxaoC_wXmsr06VTKT_y1EjPwZlRy.28ltUYBIX5WYv_XW3KfOjTyESb8ZGvgNNdVmWfwFO
 0gPyNegJ4ysozz6qEJ69foy7SvxEvEYYCpINksbY6ghONoMiZqhcKHPPnzPxi8X0POfcl4JbJh2O
 u138e_ig3ubFRsSJ7Kasum_Kms4SwDDMoHodPB.Jx8HiIyIr8gSpFxvCAMCKTYJuJRkYzg_sjOdf
 rjTIAY7uPSWqvC0aAQiTdtGxIXzQcqJPfQt69X64EIOLrFR9Ct.d1KgTVqQNTX9_xoTFDP4gzsgt
 M57G7TuiGkrGIyg0nmvjxlJ1AMPZjdrzdqP2ETp2AJYdpfvUMDWdyweHDfc7l92FhlYMGVSPd13F
 mUGkymMzHMdUhsM68CpbXeRxUCRG0x6354hzlvrn4uw3g1hxTCMIsIqfbQYMKycf9FX03PF8OaiE
 LXGTN1gJhVkTt.WLv43DlD3768Npabhi5WF5xQhkhUv7cNfABkan2Ebv17PxUgHf_N97GXtztwfC
 GO7_S3WfZJ32FB.sO45vhNCqroi9qPWlxXUgqvrQayfCV.CZ7OOiR35O_xMteESflMzQek56H8Zh
 .Ut39.cSn5G7MjcgR34NOfkdrYJ4JrWrzfwSkYFiC6U9cwgUo0s3UmddMkd5o6dyz4vENXRR4woe
 0CrkDuAkKuiSLZIBgEYDSdQUwApvFVcS_CXSNY9g8rQLMCPY9GAZXt0GJ_n4AHMPJbkkK9oDE1Ws
 QtXgSArdum5BM3k44HwaOw7mxYyXabeU0WiiY9xoFBdgo02Tkb6UKX2HI.vpvcGVrokL0pfNPww2
 JR6pw2F.jurKPOQ3OLcwN2Wopt6vg6wEh2OqrHglp6qFaAxnLazZ95Ah2Z.tPHH1r4ZIhoZVyBuq
 7FfT022Wu7T2dmZAvhgsRCt4g.7ZiJi1cKKzMdnZDMeR.cUHRdfZMLlcKdbqvgYKn9FTwhdzXPEB
 WjSCmsJTwgSPjB9K3ED0g2n.GmM7HimNE8EAPs2RTWkGHKzdElrVZp19RqukP8pF2V7t8UUw.mx4
 Gs4owibnjHlmv3gsNADyvsOy3BH.bXeSFIG5LHOlyfzEq6oo7ods3qx35OHiXTSXCdth8DnUJoQR
 _VFAgoTjtUuoOjGyouxISPv8Z3a.zuBk53AYWhQjoRhkj3sYqCUe9f5Ae4AXVVeVLLG.dqfvM62H
 g_MDDhXCfoRMl5_evtsuvEXVvlvyqAbWmTjg0GcnEtOJZ.kRYYRfolkrx6tW4aJ3RC2syJwaq6kW
 YqjaK6CAQqr_epWeqMqz3XGDx0dOWCEjwuy4IFkmqJ980zLr3NDDOG6E.uigSvJipSblsvmGwVyW
 MC3yNMBtoEw5rEJ5lC8xJQ20BYhIr_TJSCqrxre97U9bHTl8Ya.H4RypDi3kthZButgttZA1Uodb
 DoolVm8jp7k4sH3AzZ8sFdB6W2b9ZFEUmtaLcxGWqst0KLLuxJq.T115tZdcRveGNp9f1.jNowy7
 SntMHgAntEOj6._ThfS8k6ZKz7LdR4tCnX76kUSutorWsD_WdlLcO2tC16TZ980wgyxjawf0Yw1j
 eRF3S04dba1xpOyrGZ8XoZJonqyrGD5vCb2mlqVO57UL_3kbHoTnwpmxy1.jEKp5S5ByOW7VjeMF
 i7ezJFqAD7ZfZYOROqDFTHNGUKwn0pZtxAXFHjdeG2yFkBWuV1qADkTIPaJ0GP9ec7l4ddZ1__0L
 j6o34Qao-
X-Sonic-MF: <peljasz@yahoo.co.uk>
X-Sonic-ID: 02b6ed69-8a96-4fe3-b69a-e5cb92345b33
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic302.consmr.mail.ir2.yahoo.com with HTTP; Thu, 8 Jun 2023 12:11:00 +0000
Received: by hermes--production-ir2-7867f454fc-z6m77 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID fa6705cec2142187b21b7c0997816d80; 
 Thu, 08 Jun 2023 12:10:57 +0000 (UTC)
Message-ID: <bb78b2f2-0076-134c-6ab7-03ab282c39b3@yahoo.co.uk>
Date: Thu, 8 Jun 2023 14:10:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: How to post to the mailling list? (Was: IP which is not there but
 wg0 replies - ?)
Content-Language: en-US
To: wireguard@lists.zx2c4.com
References: <980aa33e-4bb4-e746-b45a-c0ab0ea7e371.ref@yahoo.co.uk>
 <980aa33e-4bb4-e746-b45a-c0ab0ea7e371@yahoo.co.uk>
 <20230608114742.63648767@parrot>
 <8792819b-a595-7789-fc6f-3bce89d13d28@yahoo.co.uk>
 <20230608140422.24071746@parrot>
From: lejeczek <peljasz@yahoo.co.uk>
In-Reply-To: <20230608140422.24071746@parrot>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.21516
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
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



On 08/06/2023 14:04, Marek Küthe wrote:
> On Thu, 8 Jun 2023 13:45:27 +0200
> lejeczek <peljasz@yahoo.co.uk> wrote:
>
>> On 08/06/2023 11:47, Marek Küthe wrote:
>>> Hello,
>>>
>>> I would be interested to know how you managed to post something on the
>>> Mailling list? I have been trying to do this for several weeks, however
>>> my messages do not arrive. Do you have a special trick?
>>>
>>> I would appreciate an answer!
>>>
>>> Greetings
>>> Marek Küthe
>>>
>>> On Thu, 8 Jun 2023 11:30:26 +0200
>>> lejeczek <peljasz@yahoo.co.uk> wrote:
>>>   
>>>> Hi guys.
>>>>
>>>> Purely accidentally I stumbled uppon:
>>>>   
>>>> -> $ ping 10.1.101
>>>> PING 10.1.101 (10.1.0.101) 56(84) bytes of data.
>>>> 64 bytes from 10.1.0.101: icmp_seq=1 ttl=64 time=0.148 ms
>>>> 64 bytes from 10.1.0.101: icmp_seq=2 ttl=64 time=0.415 ms
>>>>   
>>>> -> $ ip a ls dev wg0
>>>> 17: wg0: <POINTOPOINT,NOARP,UP,LOWER_UP> mtu 8920 qdisc
>>>> noqueue state UNKNOWN group default qlen 1000
>>>>        link/none
>>>>        inet 10.1.0.99/24 scope global wg0
>>>>           valid_lft forever preferred_lft forever
>>>> peer:
>>>> 14: wg0: <POINTOPOINT,NOARP,UP,LOWER_UP> mtu 8920 qdisc
>>>> noqueue state UNKNOWN group default qlen 1000
>>>>        link/none
>>>>        inet 10.1.0.100/24 scope global wg0
>>>>           valid_lft forever preferred_lft forever
>>>>
>>>> This a wg0's IP.
>>>> Someone could shed a bit more light on that - I'd imagine
>>>> many will appreciate, I will.
>>>> I'm thinking - is my ipcalcing messed up..
>>>> many thanks, L.
>>>>   
>>>   
>> Apparently the list (maintainers?) practice old & healthy
>> habit - which placing replies below/at bottom also is -  to
>> accept only "text" format for a message. (I presume for new
>> message/thread)
>> Test that if you will. (Thunderbird works)
>> regards, L.
> Thanks, but I have a text-only mail client. So I don't think that's
> the reason why my posts are still pending. All HTML emails I receive are
> automatically converted for example.
>
>
Perhaps checking settings at - 
https://lists.zx2c4.com/mailman/listinfo/wireguard - is also 
worth checking.
Nothing else comes to mind - I've just double-checked: if I 
leave it to Thunderbird (default format is "automatic") then 
a "failure notice" bounces back to me, whereas "text" 
manually went in.
