import re
from playwright.sync_api import Playwright, sync_playwright, expect


def run(playwright: Playwright) -> None:
    browser = playwright.chromium.launch(channel="chrome", headless=False)
    context = browser.new_context()
    page = context.new_page()
    page.goto("https://eop.baidu-int.com/product/weekly/working")
    page.get_by_role("button", name="图标: plus 新增项目").click()
    page.get_by_text("请搜索项目号").nth(2).click()
    page.get_by_role("row", name="删除 查看", exact=True).get_by_role("textbox").fill("AC19429")
    page.get_by_role("option", name="AC19429").click()
    page.locator("tr:nth-child(3) > td:nth-child(2) > .week-cell-wrap").click()
    page.get_by_placeholder("H").click()
    page.get_by_placeholder("H").fill("")
    page.get_by_role("button", name="图标: plus 新增项目").click()
    page.get_by_text("请搜索项目号").nth(3).click()
    page.get_by_role("row", name="删除 查看", exact=True).get_by_role("textbox").fill("AC18665")
    page.get_by_role("option", name="AC18665 (中科大脑-AI").click()
    page.locator("tr:nth-child(4) > td:nth-child(2) > .week-cell-wrap").click()
    page.get_by_placeholder("H").click()
    page.get_by_placeholder("H").fill("4")
    page.locator("#rc_select_5").click()
    page.get_by_text("运维专项工作").click()
    page.get_by_title("项目管理").click()
    page.get_by_role("button", name="保 存").click()
    page.get_by_role("button", name="提交已勾选工时").click()
    page.get_by_role("cell", name="未提交 星期一 04/21 撤回").get_by_label("").check()
    page.get_by_role("button", name="提交已勾选工时").click()
    page.get_by_role("button", name="知道了").click()
    page.get_by_role("button", name="删除").nth(1).click()
    page.get_by_role("button", name="确 定").click()
    page.get_by_role("button", name="删除").nth(1).click()
    page.get_by_role("button", name="确 定").click()
    page.get_by_role("button", name="提交已勾选工时").click()
    page.get_by_role("cell", name="售后 TAM 0 H").nth(1).click()
    expect(page.locator("tbody")).to_contain_text("请搜索项目号AC18665 (中科大脑-AI中心运维-中关村科学城城市大脑股份有限公司) 删除查看先收款后发货")
    page.close()

    # ---------------------
    context.close()
    browser.close()


with sync_playwright() as playwright:
    run(playwright)
