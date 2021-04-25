Return-Path: <SRS0=IBFn=JW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MISSING_HEADERS,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45AB9C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Apr 2021 13:15:44 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53FBD61360
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Apr 2021 13:15:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53FBD61360
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=yahoo.co.uk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8d00d94b;
	Sun, 25 Apr 2021 13:13:30 +0000 (UTC)
Received: from sonic309-24.consmr.mail.ir2.yahoo.com
 (sonic309-24.consmr.mail.ir2.yahoo.com [77.238.179.82])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0463b09c
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Apr 2021 13:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.uk; s=s2048;
 t=1619356408; bh=MIIVwYZAcoO5DPLNvESORnK1+MYUVPO5dKSehrmNuBI=;
 h=Subject:Cc:References:From:Date:In-Reply-To:From:Subject:Reply-To;
 b=IuEMJNzZyNFRrkicBmzqpI7nMhGo/brz+DwWJ1sYSESqfGAPG6yHIVbP7p9wcIMfFVkJ8ZhY1nILqW23Vc0CXgKi7onW7XcQEI1T00m6LOKUlP+boh1cOmsbE9lTiccKmNb3KCU3BVbd9ewcA8/VoHBq+pz8X8kdVyWWEsFwpSOevOtw4SK6i1cqxmWaMBMiYIxzV+zKF+rSwRqU/+Zo8itUdun/lF5q9dSZXAPNgAvG+KIvzsPlGTPIdRohR5lekn7ptSra9WT4uXHXNST5WI5oyPothRmQ74sjqJuMxlpIJEHpqn3ia7mz8NbrFJ5yg3E4gADoNLQSTCNmnAnoyQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1619356408; bh=SYXfC67wznIHxtFV3209FTZHJM/qVkOukf63SqNRd9K=;
 h=X-Sonic-MF:Subject:From:Date:From:Subject;
 b=kgiCC2pLFKGYJ0YEZLw0mstqbTD8Puj/zTf0gc0TVKz/PEOOSyqsBf4f5/fPS4iEWy8a6ucQqn1YFiQCWLmpUaVnb4jcFg7rJFe35Wecv5r16NJu+dlFa7V+o7V07DLiYNufNZ69HxzIElUzQy7XBmkcRMMu5JwsMs+mzuxtjd2wUn0RGAny0XHV9RoGi0eRKiFncaT/8sUfiHQg24dG84h6rlbMArHpbLMt61/1EAeHqLhOwMP5OzgwNisrSPnVwjDgHasfWVvwIqLxIq9N+8mMIboi9O/hCTg+rGViQmbsRI7Va3OPstqc+2xHCZGtl3xtvmClGdUQ8X5isJd7jw==
X-YMail-OSG: SEULGLQVM1lElCJK_ghT2aYyvhG7FHMW06DSPzGsMGcNwFETyXE5YEY9GAoWnOe
 Dwnk2etEM47QcvbdXVveZuy.vjWLFB31Hgy9X7pR26APUG6Fzjn2GyBoc8GOMeXR7DoBFuCLiCjv
 F1y_rBDOUfRndI4i2hz2qdZRydn0kAzQ3pqKOQqK4dzC2ijfl_ypZZWskz.ZyLntO_8uSp05br9O
 z.xktjlTTzAnxKRlLbQcL1Fn3qZqaNsThoEpTUVGs4E5QHVKJZN9ToPMCILAixQ_CnysCy_O9e_1
 eKNIVWp7pTj0UFErBG1l4y2wLuqosimNnKS3CXToUtxKG7_GAaXx.Wt0gZl9yAj8rs154isuL1AO
 xRClL5RQwkuCYZtSHlrBquUGlUGePgiCui7Rr5zpgB5Knq1eBvK_suCdSe4vv49ss9DbHjz3Bb6O
 C7ezlGk92wglRkmjZJjwX78zPFwcWrvNW8IazU9VmgGgKc2nd9vynWMnpRMdNYQWKWLSivfYyCh8
 uWeIxEYN6CtmMuYijKwtMbGKeIC8CnNxkaXwKWWFSFgnoCnVYM3DQa0priI8M.Y63EtkhYV4ON6c
 Q9O8Rq9QIcR.gloO7WA5s_1nBizWtyf_uBZIfL.kLB1u8CYdGZ8dUNuhs2uUUB0qP4lE4P2UIUJU
 wkNuWL.w6OOszDb2vNLBwN90RGjAwojBRrzflQq.aZ0Ulx6ggIkX6vd9wtq2qSVxc7KWY9yow3Ay
 SrJw4qqI7kMJctWfRdh7mGXernfUjK9CNTAXLR081yx9uskQF8Q8t7tU_bRDOn5iDA5DxOwQbfaq
 5OO1jy6LxEXFfUD4o3NR1hfJ5GetUymMUI7izeGKCP3EoH.sQEf.kkJidDWDtUzVUugENK9OomnU
 i7eOs_hOa6N8M5M3JLI.j9zOVBGYMPlUIomEkqV0DMXvIn5olIEoHoGu.cNtzHUO3IQvI3NH0PRw
 TPtPe2_pe768iB7ZM_zcCiXwl6u.y7YiXsK2Z4qsaqS39trJgwzxayyh6JBgtezU4GExcBJauO4K
 uOoxMsa8E55VWkTqEl43VyM_HchmaE95yoD_Sd.9tZvz0BUHqGfGMaSnqiuN9JsIi4hBYrHe2e_f
 kLzgVUQY_RPdhVVGrorqe1rmw269s06v.qxyzgfa.LK5yjlQB.EZiT8L_7XG8hPec_oiaEv1axYm
 UiNZIcy0Eh32gRTyfyCmHdVyr3X14NCH0f03YrZtmRdmdZr6XW3ndUxNC0_PcSqjtk04ULSAM2R7
 48NMYvo19O1dbM.mwMVZGPP.dSgb4lgFvi38pmQHOIzOWHwKFlVFhzkqKcC7RbUW40wu4xuCwwR0
 SHvVcCpO_MrX52TerKcZWq59tTF0radDXxR7fNc17UAvNrTKZslpUVr2zmYHFugEGV_1XgUNs2.f
 PYo9AnYSUZ6D9dNgzXTqoSKsR_fArZ6qE_P2oApQ7IY.gb.a54WEitI5LltrZLh.gLTmLE95MKwA
 _iARYeuU0KjwtJr9io2rVJRmuM5RgR8zqXvgGHcN2_IxYHUZSMT0.IQOWgNhzkYIHDe0af83973G
 fieyWs7tkRZMJD2TFT1Zw6CRSwr2BE8STZYXz30vm.krWyWfGc3w.V93Z.jvvu318MLBHmq7318t
 LP2zFS7yXJocqDDRk03qVE9gsQ6V1jueMCU0_miyo3JDtVtDXrkeo3X61WydzHEZ7s7VkQ4anBu2
 IuRhE3XRkPv4WJxwPf_v6hWZZNCZW.LO6pxBFBQP.U8zqtBurATkDnfOVoBnY9XvfDGBVRxy5zi8
 _POzmjzYBmw6kucxAy2xIUxMCKW77ccfcdQ4LQJwI4nX0bt041FhAWyQMs_3GlvBhPa9z8.XyNup
 2mgbIpQsrVUGJzEp2fkuUcG73Pn7oWGGCLB9soTIDmt4VAqBdU6mqBqn9Lh.kLGWBTmNLX948apW
 9kf7mdBRsQebeSZ69LeEPonfo7NRchqMSi3PF69KvQcgczPRXDvFkq5k9K2HvUoFpM2jZjBURPVe
 ACiJ22.U1hpJWLvIC4cCNv9RV28WNmXGYR859BTEHlVxHod9UTZGOdnMEa4ueGSZvjCkD57h8p7.
 lgmmAAAipJVbn_jZunU9Ntk_LmepBvV39izGG_gxVMVcxMATNATQ3.AaBwrMrmN2B4yXEKmNK8o1
 8uWZP0hcyaWeK8FpRr4SK6hoWIiNKsveW3xgwIyYl2ehVpLp57EXBBG6tj5zJypA_aiADFST8T0q
 rd1uQRA4k4bzLKpOG_1x0s9oZ63Sj88T8XW3aOdzaIoDRp3KUNLm26DiICN9FDqmp7ak8r59FrL4
 QXqp6nrRM_jS7Mt3Ce6McQr5xp5O3XyH9N4GlVIOs7pA4dkGItjMygn78IftQAG4N9f_CjdS509h
 Tug0BVYaCfR2gDHxOGLIj9nPv8Hx8qmsffDCvJEPR_fD_1AofiNIkMfB1HMlVdTJl5t5P9U_7Ls7
 9StAskj9N2DJAyLZ_eM4WSpkWMeiVzliG7VTDE0EaVipCzpwCC7JIC84lNaCXg7SiDOvuONu.XjG
 e.husQAOx4AV4BrB.FFSkCnlhXA--
X-Sonic-MF: <peljasz@yahoo.co.uk>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.ir2.yahoo.com with HTTP; Sun, 25 Apr 2021 13:13:28 +0000
Received: by kubenode541.mail-prod1.omega.ir2.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID 3780d2388ad345fbbeea03b86991c135; 
 Sun, 25 Apr 2021 13:13:26 +0000 (UTC)
Subject: Re: wgX iface as slave to a bridge - Linux
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <0c8b4be5-ee9d-4f19-7179-ad08a28d0574.ref@yahoo.co.uk>
 <0c8b4be5-ee9d-4f19-7179-ad08a28d0574@yahoo.co.uk>
 <CA+cYV6uTvNYv3wkZ9vS8wBP5BHEmg8rZHg7WBvyRkHdd+fjpVg@mail.gmail.com>
From: lejeczek <peljasz@yahoo.co.uk>
Message-ID: <4eeeaa84-65a9-d53e-972b-c2212babc944@yahoo.co.uk>
Date: Sun, 25 Apr 2021 14:13:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CA+cYV6uTvNYv3wkZ9vS8wBP5BHEmg8rZHg7WBvyRkHdd+fjpVg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Mailer: WebService/1.1.18138
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
 Apache-HttpAsyncClient/4.1.4 (Java/16)
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



On 25/04/2021 13:21, Chriztoffer Hansen wrote:
>> Can wiregurard ifaces be enslaved by LInux bridge? I tried
>> but it did not work for me. Similarly "mavclan" -
>> would/should wireguard work that way?
> Why would you want to enslave an L3-only capable interface to an L2 bridge?
>
> What is your use case behind the question?
>
Containers. Simple (but also can be complex too as scales 
easily) case where containers would be glued together and be 
able to communicate across nodes/hosts via wireguard 
tunnel/link.
I'm looking at it from a 'regular' admin standpoint.
Then it'd be just one wiregurard host-to-host link which all 
container could utilize, as oppose to separate wireguard 
for/in each container.

many thanks, L.

